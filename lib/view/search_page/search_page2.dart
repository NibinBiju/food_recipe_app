import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/home_page_provider/homepage_provider.dart';
import 'package:recipe_app/model/search_recipe/search_recipe_model.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SearchRecipe> ofSearchRescipes = [];
  TextEditingController searchrecipetextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var homeprovider = Provider.of<HomeProvider>(context);

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
            child: TextField(
              onSubmitted: (searchText) {
                homeprovider.getSearchedRceipe(searchrecipetextcontroller.text);
              },
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
                  )),
              style: TextStyle(
                fontSize: 24,
                fontFamily: Constants.mainFont,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: GridView.count(
          childAspectRatio: 100 / 120,
          crossAxisCount: 2,
          children: List.generate(ofSearchRescipes.length, (index) {
            List dailyInspiartion =
                homeprovider.getSearchedRceipe(searchrecipetextcontroller.text);
            dynamic recipe = dailyInspiartion[index];

            setState(() {
              ofSearchRescipes.add(
                SearchRecipe(
                  name: recipe['header']['title'],
                  imagepath: recipe['recipe_image'],
                  rating: recipe['header']['rating'].toString(),
                  time: recipe['header']['time_to_cook'],
                ),
              );
            });
            return Padding(
              padding: const EdgeInsets.all(8.0),
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
                          image:
                              NetworkImage(ofSearchRescipes[index].imagepath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      ofSearchRescipes[index].name,
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ofSearchRescipes[index].time,
                          style: TextStyle(
                            fontFamily: Constants.mainFont,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Wrap(
                          children: [
                            Text(
                              ofSearchRescipes[index].rating,
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
            );
          }),
        ));
  }
}
