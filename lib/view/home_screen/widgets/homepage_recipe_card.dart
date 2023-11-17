import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';

import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/model/api_model/api_model.dart';
import 'package:recipe_app/model/save_page_model/save_page_cookbook_model.dart';
import 'package:recipe_app/view/details_page/details_page.dart';

class DailyInspirationCard extends StatefulWidget {
  const DailyInspirationCard({
    super.key,
    required this.image,
    required this.index,
  });

  final String image;
  final int index;

  @override
  State<DailyInspirationCard> createState() => _DailyInspirationCardState();
}

class _DailyInspirationCardState extends State<DailyInspirationCard> {
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
 builder: (context) => DetailsPage(imagepath: widget.image),
            ));
      },
      child: Container(
        width: 290,
        height: 400,
        decoration: BoxDecoration(
          color: Constants.CardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 290,
                  height: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    image: DecorationImage(
      image: AssetImage(widget.image), fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        //add to save page
                        onTap: () {
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
                                                    backgroundColor:
                                                        Colors.black54,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        CreateCookBookModel
                                                            createCookBookModel =
                                                            saveProvider
                                                                    .cookbooks[
                                                                index];
                                                        saveProvider
                                                            .addRecipeToCookbook(
                                                          createCookBookModel,
                                                          SavedRecipes(
                                                              image:
                                                                  widget.image,
                                                              rating: '4.4',
                                                              recipeName:
                                                                  'Name',
                                                              time: '30m'),
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
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          child: Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          fontFamily: Constants.mainFont,
                          color: Colors.white,
                          fontSize: 27,
                        ),
                      ),
                      Text(
                        "30 min",
                        style: TextStyle(
                          fontFamily: Constants.mainFont,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '4.5',
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontFamily: Constants.mainFont,
                          fontSize: 19,
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                //to add recipe to save page
                onTap: () {},
                child: Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Ingredients to Cart',
                        style: TextStyle(
                          fontFamily: Constants.mainFont,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
