import 'package:api_connector/app/network/model/api_list_response.dart';
import 'package:http_services/http_services.dart';

abstract class ApiResponse extends ResponseBase {
  ApiResponse fromJson(Map<String, dynamic> json);
}

abstract class ApiListResponse extends ResponseBase {}

abstract class ApiListRequest extends RequestBase {}

/*abstract class NetworkService extends HttpServiceBase {
  NetworkService(Dio dioInstance) : super(dioInstance);
  Future<ApiListResponse> getApiList( ApiListRequest request );
}*/

abstract class ApiListItem {}