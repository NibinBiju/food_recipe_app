import 'package:flutter/material.dart';
import 'package:recipe_app/model/save_page_model/save_page_cookbook_model.dart';

class SavePageProvider with ChangeNotifier {
  final List<CreateCookBookModel> mySavedRecipes = [
    CreateCookBookModel(index: 0, cookBookName: 'Favorite'),
  ];

  void createNewCookBook(CreateCookBookModel createCookBookModel) {
    mySavedRecipes.add(createCookBookModel);
    notifyListeners();
  }
}
