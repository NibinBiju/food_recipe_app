import 'package:flutter/material.dart';

class ScheduleRecipePage extends StatefulWidget {
  const ScheduleRecipePage({super.key});

  @override
  ScheduleRecipePageState createState() => ScheduleRecipePageState();
}

class ScheduleRecipePageState extends State<ScheduleRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.bookmark,
                          size: 35,
                        ),
                        title: Text(
                          "Add from save",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        indent: 19,
                        endIndent: 19,
                        thickness: 1,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.search,
                          size: 35,
                        ),
                        title: Text(
                          "Search recipe",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        indent: 19,
                        endIndent: 19,
                        thickness: 1,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.edit,
                          size: 35,
                        ),
                        title: Text(
                          "Create recipe",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromARGB(255, 62, 37, 153),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 10, 83),
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircleAvatar(
              radius: 4,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        elevation: 0,
      ),
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
                                          child: Text("Date",
                                              style: TextStyle(
                                                  color: Colors.white))),
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
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Try adding new recipe",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white70),
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
