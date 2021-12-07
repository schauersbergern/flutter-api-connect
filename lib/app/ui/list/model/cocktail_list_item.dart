import 'package:api_connector/app/base/base_classes.dart';
import 'package:api_connector/app/network/model/api_list_response.dart';

class CocktailListItem extends ApiListItem {

  final String id;
  final String title;
  final String subtitle;
  final String image;
  final String detailText;

  CocktailListItem(
      this.id,
      this.title,
      this.subtitle,
      this.image,
      this.detailText
      ) : super(id, title,subtitle, image, detailText);


  static ApiListItem fromDto(NetworkCocktail dto) {

    bool alcoholic = true;

    if (dto.alcoholic == 'Non alcoholic') {
      alcoholic = false;
    }

    String detailText = '\n';

    if (alcoholic) {
      detailText += 'This Cocktail contains alcohol' + "\n\n";
    } else {
      detailText += 'This is a non alcoholic Cocktail' + "\n\n";
    }

    Map ingredientsMap = dto.ingredientsMap();
    detailText += 'Ingredients:' + "\n";
    for (int i = 1; i < ingredientsMap.length / 2; i++) {
      if ( ingredientsMap['ingredient$i'] != null && ingredientsMap['measure$i'] != null) {
        detailText += ingredientsMap['measure$i'] + ' ' + ingredientsMap['ingredient$i'] + "\n";
      }
    }
    detailText += "\n\n";
    detailText += 'How to produce this cocktail:' + "\n";
    detailText += dto.instructions;

    return CocktailListItem(
        dto.id,
        dto.name,
        dto.category,
        dto.image,
        detailText
    );
  }
}