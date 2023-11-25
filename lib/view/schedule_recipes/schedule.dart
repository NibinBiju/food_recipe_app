import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      .headline6!
                      .copyWith(color: Colors.tealAccent[100]),
                ),
              ),
              CalendarTimeline(
                showYears: true,
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
                //error
                selectableDayPredicate: (date) =>
                    date.day != 23 || date.isAtSameMomentAs(_selectedDate),
                locale: 'en',
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal[200]),
                  ),
                  child: const Text(
                    'RESET',
                    style: TextStyle(color: Color(0xFF333A47)),
                  ),
                  onPressed: () => setState(() => _resetSelectedDate()),
                ),
              ),
              const SizedBox(height: 20),
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
                height: MediaQuery.of(context).size.height * 0.52,
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
