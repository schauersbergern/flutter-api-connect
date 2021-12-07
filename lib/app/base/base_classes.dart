import 'package:api_connector/app/network/model/api_list_response.dart';
import 'package:http_services/http_services.dart';

abstract class ApiResponse extends ResponseBase {
  ApiResponse fromJson(Map<String, dynamic> json);
}

class ApiListItem {

  final String id;
  final String title;
  final String subtitle;
  final String image;
  final String instructions;
  final String ingredients;

  ApiListItem(this.id, this.title, this.subtitle, this.image, this.instructions, this.ingredients);

  static ApiListItem fromDto(NetworkCocktail dto) {}
}