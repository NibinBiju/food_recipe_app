import 'package:flutter/material.dart';

class CreateRecipePage extends StatelessWidget {
  const CreateRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.amber,
      width: double.infinity,
      height: double.infinity,
      child: Center(child: Text('create recipe')),
    ));
  }
}
