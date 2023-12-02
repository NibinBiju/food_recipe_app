import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/controller/api_controller/api_controller.dart';
import 'package:recipe_app/model/search_ingredient_model/search_ingredient_model.dart';

class SearchRecipesProvider with ChangeNotifier {
  List<SearchIngredientsModel> ingredientSearch = [];
  List ofIngredients = [];
  List searchResult = [];
  int index = 0;

  void addToSearch(SearchIngredientsModel searchIngredientsModel) {
    ingredientSearch.add(searchIngredientsModel);
    notifyListeners();
  }

  void removeFromSearch(int index) {
    ingredientSearch.removeAt(index);
    notifyListeners();
  }

  void clearAll() {
    ingredientSearch.clear();
    notifyListeners();
  }

  Future<void> fetchIngredients() async {
    final String response =
        await rootBundle.loadString('assets/json/ingredients_data.json');
    print(response);
    final data = await json.decode(response);
    ofIngredients = data['ingredients'];
    notifyListeners();
  }

  //function for search recipes
  void performSearch(String query) {
    List result = ApiController.apimodelList
        .where(
          (recipe) => recipe['header']['title'].toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    if (query.isNotEmpty) {
      searchResult = result;
    }
    notifyListeners();
  }

  //function for serach recipe by ingredients
  void searchRecipeByIngredients() {
    List results = [];
    if (ingredientSearch.isNotEmpty) {
      results = ApiController.apimodelList.where((recipe) {
        return ingredientSearch.any((ingredients) {
          return recipe['ingredients'].any((recipeIngredient) =>
              recipeIngredient['name'] == ingredients.ingredientName);
        });
      }).toList();
    }

    searchResult = results;
    notifyListeners();
  }
}
