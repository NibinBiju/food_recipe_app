import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recipe_app/view/preferance_page/pref_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefPageOne extends StatefulWidget {
  PrefPageOne({super.key});

  @override
  State<PrefPageOne> createState() => _PrefPageState();
}

class _PrefPageState extends State<PrefPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 33, 14, 66),
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
                  percent: 0.6,
                  center: Text("60.0%"),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Color(0xFF0216CC),
                )),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPrefTwo(),
                      ));
                },
                child: Text(
                  "skip",
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Text(
                "Do you follow any of the following diets?",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 28.0),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: MyGridView(),
            )),
          ],
        ));
  }
}

class MyGridView extends StatefulWidget {
  final List<String> titles = [
    'None',
    'Veg',
    'Non-Veg',
    'Low Crab',
    'None',
    'Vegan'
  ];

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  List<bool> selectedItems = List.filled(6, false);
  late Future<void> _loadingPreferences;
  @override
  void initState() {
    super.initState();

    _loadingPreferences = loadPreferences();
  }

  Future<void> loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i < selectedItems.length; i++) {
        selectedItems[i] = prefs.getBool('selected_$i') ?? false;
      }
    });
  }

  Future<void> savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < selectedItems.length; i++) {
      prefs.setBool('selected_$i', selectedItems[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isExploreButtonGreen = selectedItems.any((isSelected) => isSelected);

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: widget.titles.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 80.0,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: GridItem(
                  title: widget.titles[index],
                  onSelectedCallback: (isSelected) {
                    setState(() {
                      selectedItems[index] = isSelected;
                    });
                  },
                  isSelected: selectedItems[index],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        savePreferences();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyPrefTwo(),
                            ));
                      },
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
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
              color:
                  isExploreButtonGreen ? Color(0xFF0216CC) : Colors.redAccent,
            ),
            height: 60,
            width: 300,
          ),
        ),
      ],
    );
  }
}

class GridItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  final Function(bool) onSelectedCallback;

  GridItem({
    required this.title,
    required this.onSelectedCallback,
    required this.isSelected,
  });

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.onSelectedCallback(!widget.isSelected);
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: widget.isSelected ? Colors.red : Colors.white,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        color: Color(0xFF0216CC),
        elevation: 3.0,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 110,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
