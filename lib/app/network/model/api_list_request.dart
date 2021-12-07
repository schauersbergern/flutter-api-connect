import 'package:api_connector/app/config/config.dart';
import 'package:http_services/http_services.dart';


class ListRequest extends RequestBase {
  @override
  String get endpoint => Config.cockTailsEndpoint;

  @override
  Map<String, String> toJson() => {};
}