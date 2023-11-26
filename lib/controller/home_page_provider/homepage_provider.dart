import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/model/api_model/api_model.dart';
// import 'package:recipe_app/constants/api_constants/api_constants.dart';

class HomeProvider with ChangeNotifier {
  List apimodelList = [];
  RecipeModel? apiModel;
  bool isLoad = false;
  Future<void> fetchData() async {
    Future.delayed(Duration(seconds: 2), () {
      isLoad = true;
    });
    notifyListeners();

    final String responce =
        await rootBundle.loadString('assets/json/recipe_responce_body.json');
    final data = await json.decode(responce);
    apimodelList = data['recipes'];

    isLoad = false;
    notifyListeners();
  }

  List getDailyInspirationRecipes() {
    return apimodelList
        .where((recipe) => recipe['header']['category'] == "daily_inspiration")
        .toList();
  }

  List getNewRelease() {
    return apimodelList
        .where((recipe) => recipe['header']['category'] == "new_releases")
        .toList();
  }

  List getTrendingNow() {
    return apimodelList
        .where((recipe) => recipe['header']['category'] == "trending_now")
        .toList();
  }

  List getNewEveryDayDishes() {
    return apimodelList
        .where(
            (recipe) => recipe['header']['category'] == "new_everyday_dishes")
        .toList();
  }

  List getEasyRecipes() {
    return apimodelList
        .where((recipe) => recipe['header']['category'] == "easy_recipes")
        .toList();
  }
}
