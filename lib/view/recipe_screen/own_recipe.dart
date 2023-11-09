import 'package:flutter/material.dart';
import 'package:recipe_app/view/recipe_screen/create_recipe.dart';

class OwnRecipe extends StatefulWidget {
  const OwnRecipe({super.key});

  @override
  State<OwnRecipe> createState() => _OwnRecipeState();
}

class _OwnRecipeState extends State<OwnRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 16, 77),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "OWN RECIPE",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(top: 5),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "RECIPE NAME",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Spacer(),
                                Text("Date Created")
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        height: 90,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      );
                    }),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateRecipe(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
