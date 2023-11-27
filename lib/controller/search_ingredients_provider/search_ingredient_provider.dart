import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/model/search_ingredient_model/search_ingredient_model.dart';

class SearchIngredientProvdier with ChangeNotifier {
  List<SearchIngredientsModel> ingredientSearch = [];
  List ofIngredients = [];

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
}
