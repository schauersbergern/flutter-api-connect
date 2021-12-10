part of 'api_list_bloc.dart';

@immutable
abstract class ApiListEvent {}

class FetchListEvent extends ApiListEvent {
  final String filterValue;
  FetchListEvent(this.filterValue);
}
class FilterChanged extends ApiListEvent {
  final String filterValue;
  FilterChanged(this.filterValue);
}