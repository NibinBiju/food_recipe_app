class CreateCookBookModel {
int index;
  String? cookBookName;
  List<SavedRecipes> recipes;

  CreateCookBookModel({
    required this.index,
    this.cookBookName,
    required this.recipes,
  });
}

class SavedRecipes {
  int? index;
  String image;
  String recipeName;
  String rating;
  String time;

  SavedRecipes({
    this.index,
    required this.image,
    required this.rating,
    required this.recipeName,
    required this.time,
  });
}
