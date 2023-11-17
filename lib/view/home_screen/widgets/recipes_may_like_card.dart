import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/model/api_model/api_model.dart';
import 'package:recipe_app/model/save_page_model/save_page_cookbook_model.dart';
import 'package:recipe_app/view/details_page/details_page.dart';

class RecipesMayLikeCard extends StatefulWidget {
  const RecipesMayLikeCard({
    super.key,
    required this.index,
    required this.recipeList,
  });

  final int index;
  final List recipeList;

  @override
  State<RecipesMayLikeCard> createState() => _RecipesMayLikeCardState();
}

class _RecipesMayLikeCardState extends State<RecipesMayLikeCard> {
  ApiRecipeModel? apiRecipeModel;
  SavedRecipes? savedRecipes;

  @override
  Widget build(BuildContext context) {
    var saveProvider = Provider.of<SavePageProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsPage(imagepath: 'assets/images/Rectangle 34.png'),
            ));
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 180,
                height: 164,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                  image: DecorationImage(
                    image: NetworkImage(apiRecipeModel?.image ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 3,
                top: 3,
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.black45,

                  //button to add recipe
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Wrap(children: [
                          Container(
                            color: Constants.primaryColor,
                            child: Column(
                                children: List.generate(
                                    saveProvider.cookbooks.length,
                                    (index) => Column(
                                          children: [
                                            ListTile(
                                              title: Text(
                                                "Add to ${saveProvider.cookbooks[index].cookBookName}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      Constants.mainFont,
                                                  fontSize: 26,
                                                ),
                                              ),
                                              trailing: CircleAvatar(
                                                backgroundColor: Colors.black54,
                                                child: IconButton(
                                                  //add to save
                                                  onPressed: () {
                                                    saveProvider.recipeLength =
                                                        saveProvider
                                                            .cookbooks[index]
                                                            .recipes
                                                            .length;
                                                    CreateCookBookModel
                                                        createCookBookModel =
                                                        saveProvider
                                                            .cookbooks[index];

                                                    saveProvider
                                                        .addRecipeToCookbook(
                                                      createCookBookModel,
                                                      SavedRecipes(
                                                          image:
                                                              'assets/images/Rectangle 34.png',
                                                          rating: '4.3',
                                                          recipeName: 'rceipes',
                                                          time: '40m'),
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              height: 8,
                                            ),
                                          ],
                                        ))),
                          ),
                        ]),
                      );
                    },
                    icon: Icon(
                      Icons.bookmark_border,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  apiRecipeModel?.title ?? 'N/a',
                  style: TextStyle(
                    fontFamily: Constants.mainFont,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "30 min",
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '4.3',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 17,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
