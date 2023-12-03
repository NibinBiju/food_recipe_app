import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/view/create_recipe_screen/create_recipe.dart';
import 'package:recipe_app/view/saved_recipe_page/saved_recipe_page.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _HomePageState();
}

class _HomePageState extends State<SchedulePage> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

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
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Divider createCustomDividerWithColor(Color color) {
    return Divider(
      color: color,
      indent: 19,
      endIndent: 19,
      thickness: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    var saveProvider = Provider.of<SavePageProvider>(context);
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
            child: Image.asset(Constants.logo)),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
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
                        '${saveProvider.cookbooks.length}',
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
                height: 232,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 36, 55, 231),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    createCustomDividerWithColor(
                      Color.fromARGB(255, 36, 55, 231),
                    ),
                    buildListTile(Icons.bookmark, "Add from save"),
                    createCustomDividerWithColor(
                      Colors.white,
                    ),
                    buildListTile(Icons.search, "Search recipe"),
                    createCustomDividerWithColor(
                      Colors.white,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateRecipe()),
                        );
                      },
                      child: buildListTile(Icons.edit, "Create recipe"),
                    ),
                    createCustomDividerWithColor(
                      Color.fromARGB(255, 36, 55, 231),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Color(0xff130450),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
  Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Year',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.tealAccent[100]),
                ),
              ),
              CalendarTimeline(
                showYears: false,
                //error
                initialDate: DateTime.now().add(const Duration(days: 1)),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
                onDateSelected: (date) => setState(() => _selectedDate = date),
                leftMargin: 20,
                monthColor: Colors.white70,
                dayColor: Colors.teal[200],
                dayNameColor: const Color(0xFF333A47),
                activeDayColor: Colors.white,
                activeBackgroundDayColor: Colors.redAccent[100],
                dotsColor: const Color(0xFF333A47),

                selectableDayPredicate: (date) =>
                    date.day != 23 || date.isAtSameMomentAs(_selectedDate),
                locale: 'en',
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Selected date is $_selectedDate',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.vertical(
                        top: Radius.circular(30)),
                    color: Color.fromARGB(255, 62, 37, 153)),
                height: MediaQuery.of(context).size.height * 0.72,
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          Icons.today,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "There is nothing scheduled",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Try adding new recipe",
                        style: TextStyle(fontSize: 18, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
