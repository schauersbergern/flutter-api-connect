import 'package:api_connector/app/base/base_classes.dart';


class DrinksListRequest extends ApiListRequest {
  @override
  String get endpoint => '/api/json/v1/1/search.php?f=a';

  @override
  Map<String, String> toJson() => {};
}