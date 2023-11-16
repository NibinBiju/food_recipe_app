import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/model/recipe_page_model/recipe_model.dart';

class RecipeController {
  Box myBox = Hive.box<CreateRecipeModel>("recipeBox");
  addElement(CreateRecipeModel newModel) async {
    myBox.add(newModel);
  }

  deleteElement(int index) {
    myBox.deleteAt(index);
  }

  updateElement(int index, CreateRecipeModel updatedTodoModel) async {
    myBox.putAt(index, updatedTodoModel);
  }
}
