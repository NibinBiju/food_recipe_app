import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:recipe_app/controller/recipe_page/recipe_controller.dart';
import 'package:recipe_app/model/recipe_page_model/recipe_model.dart';
import 'package:recipe_app/view/create_recipe_screen/create_recipe.dart';
import 'package:recipe_app/view/saved_recipe_page/saved_recipe_page.dart';

class OwnRecipe extends StatefulWidget {
  OwnRecipe({super.key});

  @override
  State<OwnRecipe> createState() => _OwnRecipeState();
}

class _OwnRecipeState extends State<OwnRecipe> {
  String? name;
  DateTime? date;
  int? time;
  int? ind;
  @override
  void initState() {
    super.initState();
    loadRecipe();
  }

  void loadRecipe() async {
    final box = Hive.box<CreateRecipeModel>('recipeBox');

    CreateRecipeModel? rec = box.getAt(0);
    if (rec != null) {
      setState(() {
        name = rec.recipeName;
        date = rec.date;
        time = rec.timeInMinutes;
        ind = rec.imgIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var saveProvider = Provider.of<SavePageProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 16, 77),
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          'BigBite',
          style: TextStyle(
            fontFamily: Constants.mainFont,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(Constants.logo)),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SavedRecipePage(),
                      ));
                },
                child: Container(
                  height: 37,
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.bookmark,
                        size: 27,
                        color: Colors.white,
                      ),
                      Text(
                        '${saveProvider.cookbooks.length}',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'InriaSans',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.only(top: 5),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
itemCount: Hive.box<CreateRecipeModel>('recipeBox').length,
                  itemBuilder: (BuildContext context, int index) {
                    final box = Hive.box<CreateRecipeModel>('recipeBox');
                    CreateRecipeModel? food = box.getAt(index);
                    print("Asset Path: ${food?.imgIndex?.toString() ?? ""}");

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Constants.buttonColor,
                      ),
                      width: double.infinity,
                      height: 180,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              assetImages[food!.imgIndex ?? 0] ??
                                  "default_asset_path",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  food!.recipeName ?? "no name",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: Constants.mainFont,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                food.date != null
                                    ? DateFormat('yyyy-MM-dd')
                                        .format(food.date!)
                                    : 'No Date',
                                style: TextStyle(
                                  fontFamily: Constants.mainFont,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CreateRecipe(index: index),
                                    ),
                                  );
                                  setState(() {});
                                },
                                icon: Icon(Icons.edit, color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {
                                  RecipeController().deleteElement(index);
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            food.timeInMinutes != null
                                ? TimeOfDay(
                                    hour: food.timeInMinutes! ~/ 60,
                                    minute: food.timeInMinutes! % 60,
                                  ).format(context)
                                : 'No Time',
                            style: TextStyle(
                              fontFamily: Constants.mainFont,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateRecipe(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
