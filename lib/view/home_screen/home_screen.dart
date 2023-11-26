import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/home_page_provider/homepage_provider.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/model/api_model/api_model.dart';
import 'package:recipe_app/view/saved_recipe_page/saved_recipe_page.dart';
import 'package:recipe_app/view/home_screen/widgets/homepage_recipe_card.dart';
import 'package:recipe_app/view/home_screen/widgets/recipes_may_like_card.dart';

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

  RecipeModel? apiRecipeModel;

  // bool isLoading = false;

  // Future<void> fetchdata() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   var uri = Uri.parse(
  //       'https://api.edamam.com/api/recipes/v2?type=public&q=recipes%20you%20may%20like&app_id=a14512e5&app_key=%2082e16695d1a1908fce3decdc9e71dd01%09');
  //   var response = await http.get(uri);
  //   print(response.statusCode);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     var jsondata = jsonDecode(response.body);
  //     apiRecipeModel = ApiRecipeModel.fromJson(jsondata);
  //   } else {
  //     throw 'operation failed';
  //   }

  //   isLoading = false;
  //   setState(() {});
  // }

  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var saveprovider = Provider.of<SavePageProvider>(context);
    var homeprovider = Provider.of<HomeProvider>(context);
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

      ///
      ///
      ///body
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
                        verticalOffsetPercentage) {
                      // Map<String, dynamic> dailyrecipe =
                      //     homeprovider.getDailyInspirationRecipes()[index];
                      return DailyInspirationCard(
                        image: homeprovider.apimodelList[index]['recipe_image'],
                        index: index,
                        name: homeprovider.apimodelList[index]['header']
                            ['title'],
                        rating: homeprovider.apimodelList[index]['header']
                                ['rating']
                            .toString(),
                        time: homeprovider.apimodelList[index]['header']
                            ['time_to_cook'],
                        recipeList: homeprovider.apimodelList,
                      );
                    },
                    cardsCount: homeprovider.apimodelList.length),
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
                              image: homeprovider.apimodelList[index]
                                  ['recipe_image'],
                              index: index,
                              name: homeprovider.apimodelList[index]['header']
                                  ['title'],
                              rating: homeprovider.apimodelList[index]['header']
                                      ['rating']
                                  .toString(),
                              time: homeprovider.apimodelList[index]['header']
                                  ['time_to_cook'],
                              recipeList: homeprovider.apimodelList,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///
              ///
              ///
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
                              image: homeprovider.apimodelList[index]
                                  ['recipe_image'],
                              index: index,
                              name: homeprovider.apimodelList[index]['header']
                                  ['title'],
                              rating: homeprovider.apimodelList[index]['header']
                                      ['rating']
                                  .toString(),
                              time: homeprovider.apimodelList[index]['header']
                                  ['time_to_cook'],
                              recipeList: homeprovider.apimodelList,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///
              ///
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
                              image: homeprovider.apimodelList[index]
                                  ['recipe_image'],
                              index: index,
                              name: homeprovider.apimodelList[index]['header']
                                  ['title'],
                              rating: homeprovider.apimodelList[index]['header']
                                      ['rating']
                                  .toString(),
                              time: homeprovider.apimodelList[index]['header']
                                  ['time_to_cook'],
                              recipeList: homeprovider.apimodelList,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///
              ///
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
                              image: homeprovider.apimodelList[index]
                                  ['recipe_image'],
                              index: index,
                              name: homeprovider.apimodelList[index]['header']
                                  ['title'],
                              rating: homeprovider.apimodelList[index]['header']
                                      ['rating']
                                  .toString(),
                              time: homeprovider.apimodelList[index]['header']
                                  ['time_to_cook'],
                              recipeList: homeprovider.apimodelList,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              ///
              ///
              ///
              ///recipes you may like
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
                height: 1334,
                child: homeprovider.apimodelList.where(
                            (element) => element['header']['category']) ==
                        'daily_inspiration'
                    ? Container()
                    : GridView.count(
                        //grid container width and height
                        childAspectRatio: 140 / 200,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(
                          10,
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
                                  recipeList: homeprovider.apimodelList,
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
