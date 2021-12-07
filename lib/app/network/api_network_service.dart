
import 'dart:convert';

import 'package:api_connector/app/base/base_classes.dart';
import 'package:dio/src/dio.dart';
import 'package:http_services/http_services.dart';

import 'model/api_list_response.dart';

class CocktailNetworkService extends HttpServiceBase {
  CocktailNetworkService(Dio dioInstance) : super(dioInstance);

  @override
  Future<NetworkCocktailResponse> getApiList( ApiListRequest request ) {
    return getQuery(
        request: request,
        mapper: (json, response) => NetworkCocktailResponse.fromJson(json),
        orElse: (data, response) {
          final decoded = jsonDecode(data);
          return NetworkCocktailResponse.fromJson({'data': decoded});
        });
  }
}