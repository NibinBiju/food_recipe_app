// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/model/save_page_model/save_page_cookbook_model.dart';

class SavePageRecipeCard extends StatelessWidget {
  const SavePageRecipeCard({
    super.key,
    required this.index,
    required this.cookBookModel,
  });
  final int index;
  final CreateCookBookModel cookBookModel;

  @override
  Widget build(BuildContext context) {
    var saveProvider = Provider.of<SavePageProvider>(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Constants.CardColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Rectangle 34.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black54,
                          child: Center(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert_outlined)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        child: Text(
                          'recipe name',
                          style: TextStyle(
                            fontFamily: Constants.mainFont,
                            color: Colors.white,
                            fontSize: 32,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        'time',
                        style: TextStyle(
                          fontFamily: Constants.mainFont,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
