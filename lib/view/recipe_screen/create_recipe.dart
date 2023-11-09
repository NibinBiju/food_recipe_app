import 'package:flutter/material.dart';

class CreateRecipe extends StatefulWidget {
  CreateRecipe({super.key});

  @override
  State<CreateRecipe> createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController stepsController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != dateController.text) {
      setState(() {
        _selectedDate = picked;
        dateController.text = _selectedDate!.toLocal().toString().split(' ')[0];
      });
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
              Align(
                alignment: Alignment.topLeft,
                child: Text("Date",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: 'Date',
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w200),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 29, 40, 102),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.date_range),
                        onPressed: () => _selectDate(context),
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
                child: Card(
                  color: Color.fromARGB(255, 29, 40, 102),
                  child: Container(
                    child: Center(
                      child: Icon(Icons.image),
                    ),
                    height: 110,
                    width: 110,
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
              Container(
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
              SizedBox(
                height: 12,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      String rrname = nameController.text;
                      Navigator.pop(context, rrname);
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
