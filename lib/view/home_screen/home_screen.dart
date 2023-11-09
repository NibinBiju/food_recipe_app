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
        toolbarHeight: 70,
        title: Text(
          'BigBite',
          style: TextStyle(
            fontFamily: Constants.mainFont,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Constants.primaryColor,
        leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              Icons.cookie,
              size: 32,
              color: Colors.white,
            )),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 37,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bookmark,
                      size: 27,
                      color: Colors.black,
                    ),
                    Text(
                      '0',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'InriaSans',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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
                height: 450,
                child: Flexible(
                  child: CardSwiper(
                      allowedSwipeDirection:
                          AllowedSwipeDirection.only(left: false, right: true),
                      cardBuilder: (context, index, horizontalOffsetPercentage,
                              verticalOffsetPercentage) =>
                          dailyInspirationCardList[index],
                      cardsCount: dailyInspirationCardList.length),
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              //trending recipes
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
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
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
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

              //new every day dishes
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'New Everyday Dishes',
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    )
                  ],
                ),
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

              //easy recipes
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'Easy Recipes',
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    )
                  ],
                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
