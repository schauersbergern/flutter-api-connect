// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkResponse _$NetworkCocktailResponseFromJson(
    Map<String, dynamic> json) {
  return NetworkResponse(
    cocktails: (json['drinks'] as List)
            ?.map((e) => e == null ? null : NetworkCocktail.fromJson(e))
            ?.toList() ??
        [],
  );
}

NetworkCocktail _$NetworkCocktailFromJson(Map<String, dynamic> json) {
  return NetworkCocktail(
    id: json['idDrink'] as String,
    name: json['strDrink'] as String,
    category: json['strCategory'] as String,
    alcoholic: json['strAlcoholic'] as String,
    instructions: json['strInstructions'] as String,
    image: json['strDrinkThumb'] as String,
    ingredient1: json['strIngredient1'] as String,
    measure1: json['strMeasure1'] as String,
    ingredient2: json['strIngredient2'] as String,
    measure2: json['strMeasure2'] as String,
    ingredient3: json['strIngredient3'] as String,
    measure3: json['strMeasure3'] as String,
    ingredient4: json['strIngredient4'] as String,
    measure4: json['strMeasure4'] as String,
    ingredient5: json['strIngredient5'] as String,
    measure5: json['strMeasure5'] as String,
    ingredient6: json['strIngredient6'] as String,
    measure6: json['strMeasure6'] as String,
    ingredient7: json['strIngredient7'] as String,
    measure7: json['strMeasure7'] as String,
    ingredient8: json['strIngredient8'] as String,
    measure8: json['strMeasure8'] as String,
  );
}
