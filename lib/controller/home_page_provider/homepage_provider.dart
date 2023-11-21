import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/model/api_model/api_model.dart';
// import 'package:recipe_app/constants/api_constants/api_constants.dart';

class HomeProvider with ChangeNotifier {
  List apimodelList = [];
  RecipeModel? apiModel;
  Future<void> fetchData() async {
    final String responce =
        await rootBundle.loadString('assets/json/recipe_responce_body.json');
    final data = await json.decode(responce);
    apimodelList = data['recipes'];
    notifyListeners();
  }

  List getDailyInspirationRecipes() {
    return apimodelList
        .where((recipe) => recipe['category'] == "daily_inspiration")
        .toList();
  }
}
