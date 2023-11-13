import 'package:flutter/material.dart';
import 'package:recipe_app/constants/constants.dart';

class RecipesMayLikeCard extends StatelessWidget {
  const RecipesMayLikeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 180,
              height: 164,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
                image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle 34.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 3,
              child: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.black45,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    fontFamily: Constants.mainFont,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "30 min",
                  style: TextStyle(
                    fontFamily: Constants.mainFont,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
