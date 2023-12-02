// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

RecipeModel recipeModelFromJson(String str) =>
    RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());

class RecipeModel {
  List<Recipe>? recipes;

  RecipeModel({
    this.recipes,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        recipes: json["recipes"] == null
            ? []
            : List<Recipe>.from(
                json["recipes"]!.map((x) => Recipe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recipes": recipes == null
            ? []
            : List<dynamic>.from(recipes!.map((x) => x.toJson())),
      };
}

class Recipe {
  int? id;
  Header? header;
  List<Ingredient>? ingredients;
  List<String>? instructions;
  String? recipeImage;

  Recipe({
    this.id,
    this.header,
    this.ingredients,
    this.instructions,
    this.recipeImage,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        header: json["header"] == null ? null : Header.fromJson(json["header"]),
        ingredients: json["ingredients"] == null
            ? []
            : List<Ingredient>.from(
                json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
        instructions: json["instructions"] == null
            ? []
            : List<String>.from(json["instructions"]!.map((x) => x)),
        recipeImage: json["recipe_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "header": header?.toJson(),
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "instructions": instructions == null
            ? []
            : List<dynamic>.from(instructions!.map((x) => x)),
        "recipe_image": recipeImage,
      };
}

class Header {
  String? title;
  Category? category;
  String? timeToCook;
  double? rating;

  Header({
    this.title,
    this.category,
    this.timeToCook,
    this.rating,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        title: json["title"],
        category: categoryValues.map[json["category"]]!,
        timeToCook: json["time_to_cook"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "category": categoryValues.reverse[category],
        "time_to_cook": timeToCook,
        "rating": rating,
      };
}

enum Category { DAILY_INSPIRATION, NEW_RELEASES, TRENDING_NOW }

final categoryValues = EnumValues({
  "daily_inspiration": Category.DAILY_INSPIRATION,
  "new_releases": Category.NEW_RELEASES,
  "trending_now": Category.TRENDING_NOW
});

class Ingredient {
  String? name;
  String? image;

  Ingredient({
    this.name,
    this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
