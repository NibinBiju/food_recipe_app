// ignore_for_file: unused_local_variable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/model/save_page_model/save_page_cookbook_model.dart';

class SavePageRecipeCard extends StatelessWidget {
  const SavePageRecipeCard({
    super.key,
    required this.index,
    required this.cookBookModel,
  });
  final int index;
  final CreateCookBookModel cookBookModel;

  @override
  Widget build(BuildContext context) {
    var saveProvider = Provider.of<SavePageProvider>(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            //navigate to details page

            // Navigator.push(context, MaterialPageRoute(builder: (cnt) {
            //   return DetailsPage(
            //       index: index,
            //       recipeList: cookBookModel,
            //       ingredients: cookBookModel.recipes[index].,
            //       steps: steps);
            // }));
          },
          child: Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Constants.CardColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/shimmer image.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(16)),
                        child: CachedNetworkImage(
                          imageUrl: cookBookModel.recipes[index].image,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url,
                                  downloadProgress) =>
                              LottieBuilder.asset(
                                  'assets/animations/empty_food_saved.json'),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black54,
                            child: Center(
                              child: IconButton(

                                  //menu button inside recipe card
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_vert_outlined,
                                    color: Colors.grey.shade300,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          child: Text(
                            cookBookModel.recipes[index].recipeName,
                            style: TextStyle(
                              fontFamily: Constants.mainFont,
                              color: Colors.white,
                              fontSize: 32,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          cookBookModel.recipes[index].time,
                          style: TextStyle(
                            fontFamily: Constants.mainFont,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cookBookModel.recipes[index].rating,
                          style: TextStyle(
                            fontFamily: Constants.mainFont,
                            color: Colors.orangeAccent,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                          size: 26,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
