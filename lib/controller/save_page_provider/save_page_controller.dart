import 'package:flutter/material.dart';
import 'package:recipe_app/model/save_page_model/save_page_cookbook_model.dart';

class SavePageProvider with ChangeNotifier {
int selectedIndex = 0;
  int recipeLength = 0;

  final List<CreateCookBookModel> cookbooks = [
    CreateCookBookModel(index: 0, cookBookName: 'Favorite', recipes: [
      SavedRecipes(
          image: 'assets/images/Rectangle 34.png',
          rating: '4.3',
          recipeName: 'Chilli Chicken',
          time: '30m'),

    ]),
  ];
  List<SavedRecipes> savedRecipe = [];

  void createCookBook(CreateCookBookModel createCookBookModel) {
    cookbooks.add(createCookBookModel);
    notifyListeners();
  }

  void addRecipeToCookbook(
      CreateCookBookModel createCookBookModel, SavedRecipes savedRecipes) {
    int cookbookIndex = cookbooks
        .indexWhere((element) => element.index == createCookBookModel.index);
 if (cookbookIndex != -1) {
      CreateCookBookModel updatedCookbook = CreateCookBookModel(
          index: createCookBookModel.index,
          cookBookName: createCookBookModel.cookBookName,
          recipes: List.from(createCookBookModel.recipes)..add(savedRecipes));
      cookbooks[cookbookIndex] = updatedCookbook;
    }
    notifyListeners();
  }

  // void addNewRecipe(SavedRecipes recipes) {
  //   savedRecipes.add(recipes);
  //   notifyListeners();
  // }
}
