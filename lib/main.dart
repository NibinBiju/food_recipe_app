import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controller/search_ingredients_provider/search_ingredient_provider.dart';
import 'package:recipe_app/view/feature_screen/feature_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchIngredientProvdier>(
          create: (context) => SearchIngredientProvdier(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FeatureScreen(),
      ),
    );
  }
}
