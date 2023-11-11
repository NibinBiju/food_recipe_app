import 'package:flutter/material.dart';
import 'package:recipe_app/model/search_ingredient_model/search_ingredient_model.dart';

class SearchIngredientProvdier with ChangeNotifier {
  List<SearchIngredientsModel> ingredientSearch = [];

  void addToSearch(SearchIngredientsModel searchIngredientsModel) {
    ingredientSearch.add(searchIngredientsModel);
    notifyListeners();
  }

  void removeFromSearch(int index) {
    ingredientSearch.removeAt(index);
    notifyListeners();
  }
}
