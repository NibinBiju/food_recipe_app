import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/controller/search_ingredients_provider/search_ingredient_provider.dart';
import 'package:recipe_app/model/search_ingredient_model/search_ingredient_model.dart';
import 'package:recipe_app/view/saved_recipe_page/saved_recipe_page.dart';
import 'package:recipe_app/view/search_page/ingredients_search.dart';
import 'package:recipe_app/view/search_page/search_page2.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    Provider.of<SearchRecipesProvider>(context, listen: false)
        .fetchIngredients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var searchIngredientProvider = Provider.of<SearchRecipesProvider>(context);
    var saveProvider = Provider.of<SavePageProvider>(context);
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
            child: Image.asset(Constants.logo),
          ),
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
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontFamily: Constants.mainFont,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFD9D9D9),
                  ),

                  //search field
                  child: TextField(
                    showCursor: false,
                    keyboardType: TextInputType.none,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SearchScreen();
                        },
                      ));
                    },
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: Constants.mainFont,
                      color: const Color.fromARGB(255, 107, 107, 107),
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'search recipes',
                        suffixIcon: Icon(
                          Icons.search,
                          size: 32,
                          color: Constants.primaryColor,
                        ),
                        hintStyle: TextStyle(
                          color: Constants.primaryColor,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  child: Text(
                    'Search by Ingredients',
                    style: TextStyle(
                      fontFamily: Constants.mainFont,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                //ingredients for search
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        searchIngredientProvider.ofIngredients.length, (index) {
                      var ingredients =
                          searchIngredientProvider.ofIngredients[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            searchIngredientProvider.addToSearch(
                              SearchIngredientsModel(
                                imagepath: ingredients['image'],
                                ingredientName: ingredients['name'],
                              ),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IngredientSearch(
                                    index: index,
                                  ),
                                ));
                          },
                          child: Container(
                            width: 80,
                            height: 100,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 32,
                                    foregroundImage: AssetImage(
                                      ingredients['image'],
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: ingredients['image'],
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          LottieBuilder.asset(
                                              'assets/animations/food_loading_animation.json'),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Text(
                                  ingredients['name'],
                                  style: TextStyle(
                                    fontFamily: Constants.mainFont,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                ///
                ///
                ///search by meal
                Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  child: Text(
                    'Search by Meal',
                    style: TextStyle(
                      fontFamily: Constants.mainFont,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: GridView.count(
                    childAspectRatio: 190 / 120,
                    crossAxisCount: 2,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            color: Constants.CardColor,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://c.ndtvimg.com/2020-09/mdvmmk0g_appam_625x300_15_September_20.jpg'),
                                fit: BoxFit.cover),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 7, bottom: 7),
                                child: Text(
                                  'Breakfast',
                                  style: TextStyle(
                                    fontFamily: Constants.mainFont,
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            color: Constants.CardColor,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://www.kothiyavunu.com/wp-content/uploads/2009/08/chickenbiryani.jpg'),
                                fit: BoxFit.cover),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 7, bottom: 7),
                                child: Text(
                                  'Lunch',
                                  style: TextStyle(
                                    fontFamily: Constants.mainFont,
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: Constants.CardColor,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.pinimg.com/736x/c1/13/f1/c113f1f757454aca993ff59c95b8b22b.jpg'),
                                  fit: BoxFit.cover)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 7, bottom: 7),
                                child: Text(
                                  'Dinner',
                                  style: TextStyle(
                                    fontFamily: Constants.mainFont,
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
