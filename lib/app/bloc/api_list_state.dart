part of 'api_list_bloc.dart';

@immutable
abstract class ApiListState {}

class ApiListInitial extends ApiListState {}

class ApiListIdle extends ApiListState {}

class ApiListLoading extends ApiListState {}

class ApiListLoaded extends ApiListState {
  final List<ApiListItem> items;

  ApiListLoaded(this.items);
}

class ApiLoadingError extends ApiListState {
  final String reason;

  ApiLoadingError(this.reason);
}