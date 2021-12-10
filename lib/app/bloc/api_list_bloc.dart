import 'dart:async';

import 'package:api_connector/app/base/base_classes.dart';
import 'package:api_connector/app/network/api_network_service.dart';
import 'package:api_connector/app/network/model/api_list_request.dart';
import 'package:api_connector/app/ui/list/model/cocktail_list_item.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'api_list_event.dart';
part 'api_list_state.dart';

class ApiListBloc extends Bloc<ApiListEvent, ApiListState> {

  NetworkService networkService;

  ApiListBloc(this.networkService, {ApiListState initialState})
      : super(initialState ?? ApiListIdle()) {
    on<ApiListEvent>((event, emit) async {
      if (event is FetchListEvent) {
        try {
          emit(ApiListLoading());
          final model = await _fetchApiList(event.filterValue);
          emit(ApiListLoaded(model, event.filterValue));
        } catch (e) {
          emit(ApiLoadingError(e.toString()));
        }
      } else if (event is FilterChanged) {
        final model = await _fetchApiList(event.filterValue);
        emit(ApiListLoaded(model, event.filterValue));
      }
    });
  }

  Future<List<ApiListItem>> _fetchApiList(String filter) async {
    final response = await networkService.getApiList(ListRequest(filter));

    List<ApiListItem> items = [];

    for (var cocktail in response.cocktails) {
      items.add(CocktailListItem.fromDto(cocktail));
    }

    return items;
  }

  @override
  Future<void> close() {
    networkService.dispose();
    return super.close();
  }
}

