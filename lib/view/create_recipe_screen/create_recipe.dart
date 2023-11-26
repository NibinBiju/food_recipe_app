import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:intl/intl.dart';

import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/recipe_page/recipe_controller.dart';
import 'package:recipe_app/model/recipe_page_model/recipe_model.dart';
import 'package:recipe_app/view/create_recipe_screen/own_recipe.dart';

class CreateRecipe extends StatefulWidget {
  CreateRecipe({Key? key, this.index}) : super(key: key);
  final int? index;

  @override
  State<CreateRecipe> createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  int? selectedImageIndex;
  String? url;

  RecipeController obj = RecipeController();

  Box myBox = Hive.box<CreateRecipeModel>('recipeBox');

  void initState() {
    super.initState();
    if (widget.index != null) {
      loadRecipe(widget.index!);
    }

    CreateRecipeModel? recc = myBox.get("too");
    if (recc != null) {
      nameController.text = recc.recipeName ?? "";
      dateController.text = recc.date?.toLocal().toString().split(' ')[0] ?? "";
      timeController.text = recc.timeInMinutes != null
          ? TimeOfDay.fromDateTime(DateTime(1, 1, 1, 0, recc.timeInMinutes!))
              .format(context)
          : '';
    }
  }

  void loadRecipe(int index) async {
    final box = Hive.box<CreateRecipeModel>('recipeBox');
    CreateRecipeModel? rec = box.getAt(index);
    if (rec != null) {
      setState(() {
        nameController.text = rec.recipeName ?? "";
        dateController.text =
            rec.date?.toLocal().toString().split(' ')[0] ?? "";
        dateController.text = rec.timeInMinutes != null
            ? TimeOfDay.fromDateTime(DateTime(1, 1, 1, 0, rec.timeInMinutes!))
                .format(context)
            : '';
        selectedImageIndex = rec.imgIndex;
      });
    }
  }

  Future<void> saveRecipe() async {
    DateTime? parsedDate = DateTime.tryParse(dateController.text);
    TimeOfDay? parsedTime = TimeOfDay.fromDateTime(DateTime.now());

    if (parsedDate != null) {
      DateTime selectedTime = parsedTime != null
          ? DateTime(1, 1, 1, parsedTime.hour, parsedTime.minute)
          : DateTime(1, 1, 1, 0, 0);

      int timeInMinutes = selectedTime.hour * 60 + selectedTime.minute;

      if (widget.index != null) {
        RecipeController().updateElement(
          widget.index!,
          CreateRecipeModel(
            recipeName: nameController.text,
            date: parsedDate,
            timeInMinutes: timeInMinutes,
            imgIndex: selectedImageIndex,
          ),
        );
      } else {
        RecipeController().addElement(CreateRecipeModel(
            recipeName: nameController.text,
            date: parsedDate,
            timeInMinutes: timeInMinutes,
            imgIndex: selectedImageIndex));
      }

      setState(() {
        nameController.clear();
        dateController.clear();
        timeController.clear();
      });

      Navigator.pop(
        context,
        MaterialPageRoute(
          builder: (context) => OwnRecipe(),
        ),
      );
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController stepsController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDateAndTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime ?? TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDate = pickedDate;
          _selectedTime = pickedTime;
          dateController.text =
              _selectedDate!.toLocal().toString().split(' ')[0];
          timeController.text = _selectedTime!.format(context);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 16, 77),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "CREATE RECIPE",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Recipe Name",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 29, 40, 102),
                      hintText: 'Enter your recipe',
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w200),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: 'Select Date',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 29, 40, 102),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.date_range),
                        onPressed: () => _selectDateAndTime(context),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Time",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: timeController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Select Time',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 29, 40, 102),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: () => _selectDateAndTime(context),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Add cover image(optional)",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: assetImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImageIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Color.fromARGB(255, 29, 40, 102),
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: selectedImageIndex == index
                                    ? Colors.black
                                    : Colors.transparent,
                                width: 2.0,
                              ),
                            ),
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(assetImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Ingredients",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: ingredientsController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 29, 40, 102),
                      hintText: 'Ingredients',
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w200),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Cooking instructions",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Color.fromARGB(255, 29, 40, 102),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: TextFormField(
                      controller: stepsController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: 'Add one or multiple steps',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                        contentPadding: EdgeInsets.all(0),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      saveRecipe();
                    },
                    child: Text("save")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
