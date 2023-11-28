import 'package:flutter/material.dart';
import 'package:recipe_app/model/save_page_model/save_page_cookbook_model.dart';

class SavePageProvider with ChangeNotifier {
  int selectedIndex = 0;
  int recipeLength = 0;
  int cookbookIndex = 0;

  final List<CreateCookBookModel> cookbooks = [
    CreateCookBookModel(index: 0, cookBookName: 'Favorite', recipes: [
      SavedRecipes(
          image:
              'https://www.recipetineats.com/wp-content/uploads/2020/05/Pizza-Crust-without-yeast_5-SQ.jpg',
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

  // method for add recipe to cookbook
  void addRecipeToCookbook(
      CreateCookBookModel createCookBookModel, SavedRecipes savedRecipes) {
    cookbookIndex = cookbooks
        .indexWhere((element) => element.index == createCookBookModel.index);
    if (cookbookIndex != -1) {
      CreateCookBookModel updatedCookbook = CreateCookBookModel(
        index: createCookBookModel.index,
        cookBookName: createCookBookModel.cookBookName,
        recipes: List.from(createCookBookModel.recipes)..add(savedRecipes),
      );
      cookbooks[cookbookIndex] = updatedCookbook;
    }
    notifyListeners();
  }

  // void addNewRecipe(SavedRecipes recipes) {
  //   savedRecipes.add(recipes);
  //   notifyListeners();
  // }
}
