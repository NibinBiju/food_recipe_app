import 'package:flutter/material.dart';
import 'package:recipe_app/constants/color_constants.dart';
import 'package:recipe_app/view/recipe_screen/create_recipe.dart';

class OwnRecipe extends StatefulWidget {
  const OwnRecipe({super.key});

  @override
  State<OwnRecipe> createState() => _OwnRecipeState();
}

class _OwnRecipeState extends State<OwnRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 16, 77),
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
            child: Icon(
              Icons.cookie,
              size: 32,
              color: Colors.black,
            )),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
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
                      '0',
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
            ],
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(top: 5),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "RECIPE NAME",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: Constants.mainFont,
                                        color: Colors.white,
                                      ),
                                    )),
                                Spacer(),
                                Text(
                                  "Date Created",
                                  style: TextStyle(
                                    fontFamily: Constants.mainFont,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Time take',
                                  style: TextStyle(
                                    fontFamily: Constants.mainFont,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://www.thechunkychef.com/wp-content/uploads/2017/09/Chicken-Stroganoff-feat.jpg'),
                                fit: BoxFit.cover)),
                        width: double.infinity,
                        height: 120,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      );
                    }),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateRecipe(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
