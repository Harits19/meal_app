import 'package:meal_app/constans/base_constanta.dart';
import 'package:meal_app/meal/models/ingredient.dart';

class Meal {
  String? idMeal;
  String? strMeal;
  dynamic strDrinkAlternate;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  dynamic strTags;
  String? strYoutube;
  String? strSource;
  dynamic strImageSource;
  dynamic strCreativeCommonsConfirmed;
  dynamic dateModified;
  late List<Ingredient> listIngredient;

  static const totalIngredient = 20;

  Meal({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
    this.listIngredient = const <Ingredient>[],
  });

  Meal.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'] as String?;
    strMeal = json['strMeal'] as String?;
    strDrinkAlternate = json['strDrinkAlternate'];
    strCategory = json['strCategory'] as String?;
    strArea = json['strArea'] as String?;
    strInstructions = json['strInstructions'] as String?;
    strMealThumb = json['strMealThumb'] as String?;
    strTags = json['strTags'];
    strYoutube = json['strYoutube'] as String?;
    strSource = json['strSource'] as String?;
    strImageSource = json['strImageSource'];
    strCreativeCommonsConfirmed = json['strCreativeCommonsConfirmed'];
    dateModified = json['dateModified'];
    final listIngredientTemp = <Ingredient>[];
    List.generate(totalIngredient, (index) {
      final realIndex = index + 1;
      listIngredientTemp.add(
        Ingredient(
          ingredient: json["strIngredient$realIndex"],
          measure: json["strMeasure$realIndex"],
        ),
      );
    });
    listIngredient = listIngredientTemp;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['idMeal'] = idMeal;
    json['strMeal'] = strMeal;
    json['strDrinkAlternate'] = strDrinkAlternate;
    json['strCategory'] = strCategory;
    json['strArea'] = strArea;
    json['strInstructions'] = strInstructions;
    json['strMealThumb'] = strMealThumb;
    json['strTags'] = strTags;
    json['strYoutube'] = strYoutube;
    json['strSource'] = strSource;
    json['strImageSource'] = strImageSource;
    json['strCreativeCommonsConfirmed'] = strCreativeCommonsConfirmed;
    json['dateModified'] = dateModified;
    return json;
  }
}
