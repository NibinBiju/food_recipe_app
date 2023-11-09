import 'package:flutter/material.dart';
import 'package:recipe_app/constants/color_constants.dart';

class DailyInspirationCard extends StatelessWidget {
  const DailyInspirationCard({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 299,
      height: 350,
      decoration: BoxDecoration(
        color: Constants.dailyInspirationCardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 299,
                height: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 27,
                      ),
                    ),
                    Text(
                      "30 min",
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
