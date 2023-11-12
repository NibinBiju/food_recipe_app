import 'package:flutter/material.dart';
import 'package:recipe_app/constants/constants.dart';

class SavePageRecipeCard extends StatelessWidget {
  const SavePageRecipeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                          'Name',
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
                        'time take',
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
