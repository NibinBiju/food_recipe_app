import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/controller/home_page_provider/homepage_provider.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/controller/search_ingredients_provider/search_ingredient_provider.dart';
import 'package:recipe_app/model/recipe_page_model/recipe_model.dart';
// import 'package:recipe_app/view/create_recipe_screen/own_recipe.dart';
import 'package:recipe_app/view/feature_screen/feature_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(CreateRecipeModelAdapter());

  await Hive.openBox<CreateRecipeModel>('recipeBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // provider for recipe page
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        //provider for save page
        ChangeNotifierProvider<SavePageProvider>(
          create: (context) => SavePageProvider(),
        ),

        //provider for searchpage
        ChangeNotifierProvider<SearchRecipesProvider>(
          create: (context) => SearchRecipesProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FeatureScreen(),
      ),
    );
  }
}
