import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/search_ingredients_provider/search_ingredient_provider.dart';
import 'package:recipe_app/view/details_page/details_page.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // List<SearchRecipe> ofSearchRescipes = [];
  TextEditingController searchrecipetextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchRecipesProvider>(context);
    return Scaffold(
        backgroundColor: Constants.primaryColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )),
          elevation: 0,
          toolbarHeight: 80,
          backgroundColor: Constants.primaryColor,
          title: Container(
            padding: EdgeInsets.only(left: 10),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Color(0xFFD9D9D9),
            ),
            child: Center(
              child: TextField(
                onSubmitted: (query) {
   searchProvider.performSearch(query.trim());
                },
                onChanged: (query) {
                  searchProvider.performSearch(query.trim());
                },
                cursorOpacityAnimates: true,
                cursorHeight: 40,
                controller: searchrecipetextcontroller,
                cursorColor: Constants.primaryColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
  suffixIcon: IconButton(
                      onPressed: () {
                        searchrecipetextcontroller.clear();
                      },
                      icon: Icon(Icons.close)),
                  hintText: 'search recipes',
                  hintStyle: TextStyle(
                    color: Constants.CardColor,
                    fontSize: 24,
                  ),
                ),
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: Constants.mainFont,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
 body: searchProvider.searchResult.length == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Column(
                    children: [
                      Container(
                        width: 170,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                              'assets/images/icons8-nothing-found-48.png'),
                          fit: BoxFit.fitHeight,
                        )),
                      ),
                      Text(
                        'Recipe not found !',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Constants.mainFont,
                          fontSize: 16,
                        ),
                      )
                    ],
                  )),
                ],
              )
            : GridView.count(
                childAspectRatio: 105 / 120,
                crossAxisCount: 2,
                children:
                    List.generate(searchProvider.searchResult.length, (index) {
                  Map<String, dynamic> recipe =
                      searchProvider.searchResult[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailsPage(
                              index: index,
                              recipeList: recipe,
                              ingredients: recipe['ingredients'],
                              steps: recipe['instructions']);
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Constants.CardColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                color: Constants.primaryColor,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    recipe['recipe_image'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              recipe['header']['title'],
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  recipe['header']['time_to_cook'].toString(),
                                  style: TextStyle(
                                    fontFamily: Constants.mainFont,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      recipe['header']['rating'].toString(),
                                      style: TextStyle(
                                        fontFamily: Constants.mainFont,
                                        color: Colors.orangeAccent,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ));
  }
}
