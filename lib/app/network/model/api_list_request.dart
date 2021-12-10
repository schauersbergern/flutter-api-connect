import 'package:api_connector/app/config/config.dart';
import 'package:http_services/http_services.dart';


class ListRequest extends RequestBase {

  final String filter;
  ListRequest(this.filter);

  @override
  String get endpoint => "${Config.cockTailsEndpoint}${filter}";

  @override
  Map<String, String> toJson() => {};
}