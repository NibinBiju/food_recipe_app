import 'package:flutter/material.dart';
import 'package:recipe_app/constants/color_constants.dart';

class SavedRecipePage extends StatelessWidget {
  const SavedRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Saved Recipes',
                style: TextStyle(
                  fontFamily: Constants.mainFont,
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              Row(
                children: List.generate(2, (index) => Container()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
