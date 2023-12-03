import 'package:flutter/material.dart';
import 'package:recipe_app/constants/constants.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({
    super.key,
    required this.index,
    required this.recipeList,
    required this.ingredients,
    required this.steps,
  });
  final int index;
  final dynamic recipeList;
  final List ingredients;
  final List steps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                //recipe image
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(recipeList['recipe_image']),
                              fit: BoxFit.cover)),
                    ),
                    //main body
                    Container(
                      width: double.infinity,
                      height: 90,
                      color: Constants.primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'About recipe',
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                color: Colors.white,
                                fontSize: 27,
                              ),
                            ),
                          ),
                          Text(
                            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took.''',
                            style: TextStyle(
                              fontFamily: Constants.mainFont,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),

                            //total time card
                            child: Container(
                                width: double.infinity,
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                  border: Border.all(
                                    width: 2,
                                    color:
                                        const Color.fromARGB(255, 59, 59, 59),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          recipeList['header']['time_to_cook'],
                                          style: TextStyle(
                                            fontFamily: Constants.mainFont,
                                            fontSize: 27,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Total time',
                                          style: TextStyle(
                                            fontFamily: Constants.mainFont,
                                            fontSize: 24,
                                            color: const Color.fromARGB(
                                                255, 170, 170, 170),
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Nutrition Per Saving',
                                    style: TextStyle(
                                      fontFamily: Constants.mainFont,
                                      color: Colors.white,
                                      fontSize: 27,
                                    ),
                                  ),
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'CALORIES',
                                            style: TextStyle(
                                              fontFamily: Constants.mainFont,
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            recipeList['header']['protien']
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: Constants.mainFont,
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          )
                                        ],
                                      ),
                                      VerticalDivider(
                                        width: 20,
                                        thickness: 1,
                                        color: const Color.fromARGB(
                                            255, 170, 170, 170),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'PROTIEN',
                                            style: TextStyle(
                                              fontFamily: Constants.mainFont,
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            recipeList['header']['protien']
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: Constants.mainFont,
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          )
                                        ],
                                      ),
                                      VerticalDivider(
                                        width: 20,
                                        thickness: 1,
                                        color: const Color.fromARGB(
                                            255, 170, 170, 170),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'CARBS',
                                            style: TextStyle(
                                              fontFamily: Constants.mainFont,
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            recipeList['header']['nutrients']
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: Constants.mainFont,
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          )
                                        ],
                                      ),
                                      VerticalDivider(
                                        width: 20,
                                        thickness: 1,
                                        color: const Color.fromARGB(
                                            255, 170, 170, 170),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'FAT',
                                            style: TextStyle(
                                              fontFamily: Constants.mainFont,
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            recipeList['header']['fat']
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: Constants.mainFont,
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Ingredients',
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                color: Colors.white,
                                fontSize: 27,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Constants.CardColor,
                              ),

                              //ingredients list
                              child: Column(
                                children: List.generate(
                                    1,
                                    (index) => Column(
                                          children: ingredients
                                              .map(
                                                (e) => Column(
                                                  children: [
                                                    ListTile(
                                                      leading: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                          e['image'],
                                                        ),
                                                      ),
                                                      title: Text(
                                                        e['name'],
                                                        style: TextStyle(
                                                          fontFamily: Constants
                                                              .mainFont,
                                                          color: const Color
                                                              .fromARGB(255,
                                                              202, 202, 202),
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontSize: 26,
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2,
                                                      color: Colors.blueGrey,
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                        )),
                              )),

                          SizedBox(
                            height: 30,
                          ),

                          //directions
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Directions',
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                color: Colors.white,
                                fontSize: 27,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Constants.CardColor,
                              borderRadius: BorderRadius.circular(29),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                steps.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(19),
                                      color: Constants.primaryColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Step ${index + 1}',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.mainFont,
                                                    color: Colors.white,
                                                    fontSize: 27,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              steps[index],
                                              style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 153, 153, 153),
                                                fontFamily: Constants.mainFont,
                                                fontSize: 25,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
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

                //app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 40),
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            child: Center(
                              child: IconButton(
                                //save recipe
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.bookmark_border_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                //floating card
                Positioned(
                  top: 300,
                  left: 29,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    width: 340,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 10,
                        )
                      ],
                      color: Constants.CardColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'recipe',
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                color: Colors.white,
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              recipeList['header']['title'],
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                recipeList['header']['rating'].toString(),
                                style: TextStyle(
                                  fontFamily: Constants.mainFont,
                                  fontSize: 21,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
