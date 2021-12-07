
import 'dart:convert';

import 'package:dio/src/dio.dart';
import 'package:http_services/http_services.dart';

import 'model/api_list_request.dart';
import 'model/api_list_response.dart';

class NetworkService extends HttpServiceBase {
  NetworkService(Dio dioInstance) : super(dioInstance);

  Future<NetworkResponse> getApiList( ListRequest request ) {
    return getQuery(
        request: request,
        mapper: (json, response) => NetworkResponse.fromJson(json),
        orElse: (data, response) {
          final decoded = jsonDecode(data);
          return NetworkResponse.fromJson({'data': decoded});
        });
  }
}