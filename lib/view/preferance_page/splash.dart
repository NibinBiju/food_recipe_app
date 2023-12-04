import 'package:flutter/material.dart';
import 'package:recipe_app/view/feature_screen/feature_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool anyKeyExists =
          prefs.getKeys().any((key) => key.startsWith('selected_'));
      bool isPrefTwoDataAvailable = prefs.containsKey('progress');

      if (anyKeyExists && isPrefTwoDataAvailable) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FeatureScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Splash()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen"),
      ),
      body: Center(
        child: Column(
          children: [CircularProgressIndicator()],
        ),
      ),
    );
  }
}
