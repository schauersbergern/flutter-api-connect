
import 'package:api_connector/app/base/base_classes.dart';
import 'package:api_connector/app/network/model/api_list_response.dart';

class CocktailListItem extends ApiListItem {

  final String id;
  final String name;
  final String category;
  final bool alcoholic;
  final String image;
  final String instructions;
  final String ingredients;

  CocktailListItem(
      this.id,
      this.name,
      this.category,
      this.alcoholic,
      this.image,
      this.instructions,
      this.ingredients
      );

  factory CocktailListItem.empty() {
    return CocktailListItem('', '', '', false, '', '', '');
  }

  factory CocktailListItem.fromDto(NetworkCocktail dto) {

    bool alcoholic = true;

    if (dto.alcoholic == "Non alcoholic") {
      alcoholic = false;
    }

    String ingredients = '';
    Map ingredientsMap = dto.ingredientsMap();

    for (int i = 1; i < ingredientsMap.length / 2; i++) {
      if ( ingredientsMap['ingredient$i'] != null && ingredientsMap['measure$i'] != null) {
        ingredients += ingredientsMap['measure$i'] + ' ' + ingredientsMap['ingredient$i'] + "\n";
      }
    }

    return CocktailListItem(
        dto.id,
        dto.name,
        dto.category,
        alcoholic,
        dto.image,
        dto.instructions,
        ingredients
    );
  }
}