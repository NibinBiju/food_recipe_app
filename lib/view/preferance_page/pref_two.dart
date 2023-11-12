import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyPrefTwo extends StatefulWidget {
  const MyPrefTwo({super.key});

  @override
  State<MyPrefTwo> createState() => MyPrefState();
}

class MyPrefState extends State<MyPrefTwo> {
  String getTextForIndex(int index) {
    switch (index) {
      case 0:
        return "Get Inspired";
      case 1:
        return "Eat Healty";
      case 2:
        return "Budget-Friendly";
      case 3:
        return "Quick & Easy";
      case 4:
        return "Learn to Easy";
      case 5:
        return "Plan Better";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 14, 66),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 70,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2500,
              percent: 0.8,
              center: Text("80.0%"),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Color(0xFF0216CC),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "skip",
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 33, 14, 66),
      body: Column(
        children: [
          Text(
            "What is your goal?",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                print("hello");
              },
              child: GridView.builder(
                padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 204, 194, 194)),
                    padding: const EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        getTextForIndex(index),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Explore",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_right,
                    size: 40,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF0216CC),
              ),
              height: 70,
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}
