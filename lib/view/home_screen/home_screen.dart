import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:recipe_app/constants/color_constants.dart';
import 'package:recipe_app/view/widgets/daily_inspiration_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List dailyInspirationCardList = [
    const DailyInspirationCard(image: 'assets/images/Rectangle 17 (1).png'),
    const DailyInspirationCard(image: 'assets/images/Rectangle 17.png'),
    const DailyInspirationCard(image: 'assets/images/Rectangle 34.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              Icons.cookie,
              size: 32,
              color: Colors.black,
            )),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.bookmark,
                        size: 27,
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'InriaSans',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Daily Inspiration',
                    style: TextStyle(
                      fontFamily: Constants.mainFont,
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  )
                ],
              ),

              //card swiper
              SizedBox(
                height: 388,
                child: Flexible(
                  child: CardSwiper(
                      cardBuilder: (context, index, horizontalOffsetPercentage,
                              verticalOffsetPercentage) =>
                          dailyInspirationCardList[index],
                      cardsCount: dailyInspirationCardList.length),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    'Trending Now',
                    style: TextStyle(
                      fontFamily: Constants.mainFont,
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                      dailyInspirationCardList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            dailyInspirationCardList[index],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //new releases
              Row(
                children: [
                  Text(
                    'New Releases',
                    style: TextStyle(
                      fontFamily: Constants.mainFont,
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                      dailyInspirationCardList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            dailyInspirationCardList[index],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
