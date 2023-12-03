import 'package:hive/hive.dart';
part 'recipe_model.g.dart';

@HiveType(typeId: 1)
class CreateRecipeModel {
  @HiveField(0)
  String? recipeName;
  @HiveField(1)
  DateTime? date;
  @HiveField(2)
  int? timeInMinutes;
  @HiveField(3)
  int? imgIndex;
  @HiveField(4)
  String? imgUrl;

  CreateRecipeModel(
      {required this.recipeName,
      required this.date,
      required this.timeInMinutes,
      required this.imgIndex,
      this.imgUrl});
}
