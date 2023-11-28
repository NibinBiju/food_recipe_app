import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/home_page_provider/homepage_provider.dart';
import 'package:recipe_app/view/details_page/details_page.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // List<SearchRecipe> ofSearchRescipes = [];
  TextEditingController searchrecipetextcontroller = TextEditingController();
  List searchResult = [];

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var homeprovider = Provider.of<HomeProvider>(context);

    //function to search
    void _performSearch(String query) {
      List result = homeprovider.apimodelList
          .where((recipe) => recipe['header']['title']
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
      if (query.isNotEmpty) {
        searchResult = result;
        setState(() {});
      }
    }

    return Scaffold(
        backgroundColor: Constants.primaryColor,
        appBar: AppBar(
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
                  _performSearch(query);
                },
                onChanged: (query) {
                  _performSearch(query);
                },
                autofocus: true,
                cursorOpacityAnimates: true,
                cursorHeight: 40,
                controller: searchrecipetextcontroller,
                cursorColor: Constants.primaryColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    size: 32,
                    color: Constants.primaryColor,
                  ),
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
        body: GridView.count(
          childAspectRatio: 105 / 120,
          crossAxisCount: 2,
          children: List.generate(searchResult.length, (index) {
            Map<String, dynamic> recipe = searchResult[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
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
