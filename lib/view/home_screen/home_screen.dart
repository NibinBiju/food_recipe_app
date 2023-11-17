import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/model/api_model/api_model.dart';
import 'package:recipe_app/view/saved_recipe_page/saved_recipe_page.dart';
import 'package:recipe_app/view/home_screen/widgets/homepage_recipe_card.dart';
import 'package:recipe_app/view/home_screen/widgets/recipes_may_like_card.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List images = [
    'assets/images/Rectangle 17 (1).png',
    'assets/images/Rectangle 17.png',
    'assets/images/Rectangle 34.png'
  ];

  ApiRecipeModel? apiRecipeModel;
  List data = [];

  Future<void> fetchData() async {
    var uri = Uri.parse(
        'https://api.spoonacular.com/recipes/716429/information?apiKey=fecb801beb464341a290d1e04871cce2&includeNutrition=false');

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        log(response.statusCode);
        print(response.body);
        var jsonData = jsonDecode(response.body);
        // Assuming ApiRecipeModel.fromJson is a method that converts JSON to your model
        apiRecipeModel = ApiRecipeModel.fromJson(jsonData);
      } else {
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var saveprovider = Provider.of<SavePageProvider>(context);
    return Scaffold(
      backgroundColor: Constants.primaryColor,
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
                splashColor: Colors.black,
                highlightColor: Colors.transparent,
                //for navigate to save recipe page
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
                        '${saveprovider.cookbooks.length}',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Daily Inspiration',
                    style: TextStyle(
                      fontFamily: Constants.mainFont,
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  )
                ],
              ),

              //card swiper
              SizedBox(
                height: 450,
                child: CardSwiper(
                    backCardOffset: Offset(40, 30),
                    allowedSwipeDirection:
                        AllowedSwipeDirection.only(right: true, left: false),
                    cardBuilder: (context, index, horizontalOffsetPercentage,
                            verticalOffsetPercentage) =>
                        DailyInspirationCard(
                            image: images[index], index: index),
                    cardsCount: images.length),
              ),
              const SizedBox(
                height: 16,
              ),

              //trending recipes
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'Trending Now',
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                      images.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            DailyInspirationCard(
                                image: images[index], index: index),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //new releases
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'New Releases',
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                      images.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            DailyInspirationCard(
                                image: images[index], index: index),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //new every day dishes
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'New Everyday Dishes',
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                      images.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            DailyInspirationCard(
                                image: images[index], index: index),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //easy recipes
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'Easy Recipes',
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                      images.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            DailyInspirationCard(
                                image: images[index], index: index),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'Recipes you may like',
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1200,
                child: GridView.count(
                  //grid container width and height
                  childAspectRatio: 140 / 180,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                    32,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        shadowColor: Colors.black87,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Constants.CardColor,
                          ),
                          child: RecipesMayLikeCard(
                            index: index,
                            recipeList: data,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
