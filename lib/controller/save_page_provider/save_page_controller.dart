import 'package:flutter/material.dart';
import 'package:recipe_app/model/save_page_model/save_page_cookbook_model.dart';

class SavePageProvider with ChangeNotifier {
  int selectedIndex = 0;
  int recipeLength = 0;
  int cookbookIndex = 0;
  final List<CreateCookBookModel> cookbooks = [
    CreateCookBookModel(index: 0, cookBookName: 'Favorite', recipes: []),
  ];
  List<SavedRecipes> savedRecipe = [];
  void createCookBook(CreateCookBookModel createCookBookModel) {
    cookbooks.add(createCookBookModel);
    notifyListeners();
  }

// method for add recipe to cookbook
  void addRecipeToCookbook(
      CreateCookBookModel createCookBookModel, SavedRecipes savedRecipes) {
    cookbookIndex = cookbooks
        .indexWhere((element) => element.index == createCookBookModel.index);

    if (cookbookIndex != -1) {
      // Create a new instance of CreateCookBookModel
      CreateCookBookModel updatedCookbook = CreateCookBookModel(
        index: createCookBookModel.index,
        cookBookName: createCookBookModel.cookBookName,
        recipes: List.from(createCookBookModel.recipes),
      );

      // Add the new recipe to the recipes list
      updatedCookbook.recipes.add(savedRecipes);

      // Update the cookbooks list
      cookbooks[cookbookIndex] = updatedCookbook;
    }

    notifyListeners();
  }

  Map<String, int> getRecipesCount() {
    Map<String, int> recipeCountMap = {};
    for (CreateCookBookModel cookbook in cookbooks) {
      recipeCountMap[cookbook.cookBookName!] = cookbook.recipes.length;
    }
    return recipeCountMap;
  }
}
