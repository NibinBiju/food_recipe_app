import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

class PrefPageOne extends StatefulWidget {
  PrefPageOne({super.key});

  @override
  State<PrefPageOne> createState() => _PrefPageState();
}

class _PrefPageState extends State<PrefPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff130450),
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
                )),
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
        body: Stack(
          children: [
            Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 33, 14, 66)),
                height: double.infinity),
            Positioned(
              left: 30,
              right: 30,
              bottom: 20,
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
                width: 280,
              ),
            ),
            CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        "Do you follow any of the following diets?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 35.0),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 30, right: 30),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 19.0,
                        mainAxisSpacing: 16.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF0216CC),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 180,
                              width: double.infinity,
                            ),
                            Positioned(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(96, 152, 42, 42),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 120,
                            )),
                            Positioned(
                                left: 10,
                                right: 10,
                                bottom: 10,
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "HELLO",
                                      style: TextStyle(color: Colors.white),
                                    )))
                          ],
                        );
                      }, childCount: 6),
                    ),
                  ),
                ]),
          ],
        ));
  }
}
