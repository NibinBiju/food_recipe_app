import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/search_ingredients_provider/search_ingredient_provider.dart';
import 'package:recipe_app/model/search_ingredient_model/search_ingredient_model.dart';
import 'package:recipe_app/view/search_page/search_page2.dart';

class IngredientSearch extends StatelessWidget {
  IngredientSearch({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    var ingredientProvider = Provider.of<SearchRecipesProvider>(context);
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              ingredientProvider.clearAll();
            },
            icon: Icon(Icons.arrow_back_ios)),
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        toolbarHeight: 120,
        title: Container(
          padding: EdgeInsets.only(left: 10),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFFD9D9D9),
          ),

          //search field
          child: TextField(
            cursorColor: const Color.fromARGB(255, 107, 107, 107),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              fontFamily: Constants.mainFont,
              color: const Color.fromARGB(255, 107, 107, 107),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'search common ingredients',
              suffixIcon: Icon(
                Icons.search,
                size: 32,
              ),
            ),

            //function for search submit
            onSubmitted: (value) {},
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ingredientProvider.ingredientSearch.isEmpty
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Selected ingredients',
                          style: TextStyle(
                            fontFamily: Constants.mainFont,
                            color: Colors.white,
                            fontSize: 26,
                          ),
                        ),
                      ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      ingredientProvider.ingredientSearch.length,
                      (index) => Container(
                        width: 80,
                        height: 100,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 32,
                                  foregroundImage: NetworkImage(
                                      ingredientProvider
                                          .ingredientSearch[index].imagepath),
                                ),
                                Text(
                                  ingredientProvider
                                      .ingredientSearch[index].ingredientName,
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
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                //remove from search
                                onTap: () {
                                  ingredientProvider.removeFromSearch(index);
                                },
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Constants.CardColor,
                                  child: Center(
                                      child: Icon(
                                    Icons.close_rounded,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    'Suggested For You',
                    style: TextStyle(
                      fontFamily: Constants.mainFont,
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: List.generate(
                      32,
                      (index) => InkWell(
                        onTap: () {
                          //add to search list
                          ingredientProvider.addToSearch(
                            SearchIngredientsModel(
                              imagepath: ingredientProvider.ofIngredients[index]
                                  ['image'],
                              ingredientName: ingredientProvider
                                  .ofIngredients[index]['name'],
                            ),
                          );
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          child: Column(
                            children: [
                              //ingredients suggested for user
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 32,
                                foregroundImage: NetworkImage(ingredientProvider
                                    .ofIngredients[index]['image']),
                              ),
                              Text(
                                ingredientProvider.ofIngredients[index]['name'],
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ingredientProvider.ingredientSearch.isEmpty
                    ? Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 75, 75, 75),
                        ),
                        child: Center(
                          child: Text(
                            'Search with ${ingredientProvider.ingredientSearch.length} Ingredients',
                            style: TextStyle(
                              fontFamily: Constants.mainFont,
                              color: Colors.grey,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        highlightColor: Constants.CardColor,
                        //function for search by ingredients
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SearchScreen();
                          }));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Constants.buttonColor,
                          ),
                          child: Center(
                            child: Text(
                              'Search with ${ingredientProvider.ingredientSearch.length} Ingredients',
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
