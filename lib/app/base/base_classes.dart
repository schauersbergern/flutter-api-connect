import 'package:api_connector/app/network/model/api_list_response.dart';
import 'package:http_services/http_services.dart';

abstract class ApiResponse extends ResponseBase {
  ApiResponse fromJson(Map<String, dynamic> json);
}

class ApiListItem {

  final String id;
  final String name;
  final String category;
  final bool alcoholic;
  final String image;
  final String instructions;
  final String ingredients;

  ApiListItem(this.id, this.name, this.category, this.alcoholic, this.image, this.instructions, this.ingredients);

  static ApiListItem fromDto(NetworkCocktail dto) {}
}