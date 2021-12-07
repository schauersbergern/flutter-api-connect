import 'package:http_services/http_services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_list_response.g.dart';

@JsonSerializable(createToJson: false)
class NetworkResponse extends ResponseBase {
  @JsonKey(name: 'drinks', defaultValue: <NetworkCocktail>[])
  final List<NetworkCocktail> cocktails;

  NetworkResponse({
    this.cocktails,
  });

  factory NetworkResponse.fromJson(json) => _$NetworkCocktailResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class NetworkCocktail {

  factory NetworkCocktail.fromJson(json) => _$NetworkCocktailFromJson(json);

  @JsonKey(name: 'idDrink')
  final String id;
  @JsonKey(name: 'strDrink')
  final String name;
  @JsonKey(name: 'strCategory')
  final String category;
  @JsonKey(name: 'strAlcoholic')
  final String alcoholic;
  @JsonKey(name: 'strInstructions')
  final String instructions;
  @JsonKey(name: 'strDrinkThumb')
  final String image;

  @JsonKey(name: 'strIngredient1')
  final String ingredient1;
  @JsonKey(name: 'strMeasure1')
  final String measure1;
  @JsonKey(name: 'strIngredient2')
  final String ingredient2;
  @JsonKey(name: 'strMeasure2')
  final String measure2;
  @JsonKey(name: 'strIngredient3')
  final String ingredient3;
  @JsonKey(name: 'strMeasure3')
  final String measure3;
  @JsonKey(name: 'strIngredient4')
  final String ingredient4;
  @JsonKey(name: 'strMeasure4')
  final String measure4;
  @JsonKey(name: 'strIngredient5')
  final String ingredient5;
  @JsonKey(name: 'strMeasure5')
  final String measure5;
  @JsonKey(name: 'strIngredient6')
  final String ingredient6;
  @JsonKey(name: 'strMeasure6')
  final String measure6;
  @JsonKey(name: 'strIngredient7')
  final String ingredient7;
  @JsonKey(name: 'strMeasure7')
  final String measure7;
  @JsonKey(name: 'strIngredient8')
  final String ingredient8;
  @JsonKey(name: 'strMeasure8')
  final String measure8;


  NetworkCocktail({
    this.id,
    this.name,
    this.category,
    this.alcoholic,
    this.instructions,
    this.image,
    this.ingredient1,
    this.measure1,
    this.ingredient2,
    this.measure2,
    this.ingredient3,
    this.measure3,
    this.ingredient4,
    this.measure4,
    this.ingredient5,
    this.measure5,
    this.ingredient6,
    this.measure6,
    this.ingredient7,
    this.measure7,
    this.ingredient8,
    this.measure8,
  });

  Map<String, dynamic> ingredientsMap() {
    return {
      'ingredient1': ingredient1,
      'measure1': measure1,
      'ingredient2': ingredient2,
      'measure2': measure2,
      'ingredient3': ingredient3,
      'measure3': measure3,
      'ingredient4': ingredient4,
      'measure4': measure4,
      'ingredient5': ingredient5,
      'measure5': measure5,
      'ingredient6': ingredient6,
      'measure6': measure6,
      'ingredient7': ingredient7,
      'measure7': measure7,
      'ingredient8': ingredient8,
      'measure8': measure8,
    };
  }
}
