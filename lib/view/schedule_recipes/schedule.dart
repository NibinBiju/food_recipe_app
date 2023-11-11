import 'package:flutter/material.dart';
import 'package:recipe_app/constants/color_constants.dart';
import 'package:recipe_app/view/saved_recipe_page/saved_recipe_page.dart';

class ScheduleRecipePage extends StatefulWidget {
  const ScheduleRecipePage({super.key});

  @override
  ScheduleRecipePageState createState() => ScheduleRecipePageState();
}

class ScheduleRecipePageState extends State<ScheduleRecipePage> {
  Widget buildListTile(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            size: 35,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: Constants.mainFont,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Image.asset('assets/images/logo (1).png')),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
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
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF0216CC),
        onPressed: () {
          showModalBottomSheet<void>(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 62, 37, 153),
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 36, 55, 231),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: [
                    buildListTile(Icons.bookmark, "Add from save"),
                    Divider(
                      color: Colors.white,
                      indent: 19,
                      endIndent: 19,
                      thickness: 1,
                    ),
                    buildListTile(Icons.search, "Search recipe"),
                    Divider(
                      color: Colors.white,
                      indent: 19,
                      endIndent: 19,
                      thickness: 1,
                    ),
                    buildListTile(Icons.edit, "Create recipe"),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromARGB(255, 62, 37, 153),
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              color: Color.fromARGB(255, 12, 10, 83),
            ),
          ),

          //day and date
          Positioned(
            top: 40,
            child: Container(
              height: 70,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      separatorBuilder: (context, index) => SizedBox(width: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.all(8),
                            child: Stack(
                              children: [
                                Container(
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        "Day",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  height: 65,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(66, 67, 65, 65),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Positioned(
                                    top: 25,
                                    bottom: 0,
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Date",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 74, 68, 68),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      height: 30,
                                      width: 40,
                                    ))
                              ],
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.8,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 62, 37, 153),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: Icon(
                              Icons.today,
                              color: Colors.white,
                              size: 70,
                            )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "There is nothing scheduled",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: Constants.mainFont),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Try adding new recipe",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                  fontFamily: Constants.mainFont),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
