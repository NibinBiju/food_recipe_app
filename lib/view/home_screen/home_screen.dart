import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:recipe_app/constants/color_constants.dart';
import 'package:recipe_app/view/saved_recipe_page/saved_recipe_page.dart';
import 'package:recipe_app/view/widgets/daily_inspiration_card.dart';
import 'package:recipe_app/view/widgets/recipes_may_like_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List dailyInspirationCardList = [
    const DailyInspirationCard(image: 'assets/images/Rectangle 17 (1).png'),
    const DailyInspirationCard(image: 'assets/images/Rectangle 17.png'),
    const DailyInspirationCard(image: 'assets/images/Rectangle 34.png'),
  ];
  String greeting(int hour) {
    if (hour < 12) {
      return 'Breakfast Time';
    }
    if (hour < 17) {
      return 'Lunch Time';
    }
    return 'Dinner Time';
  }

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
            child: Image.asset('assets/images/logo (1).png')),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                //for navigate to save recipe page
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SavedRecipePage(),
                      ));
                },
                child: Container(
                  height: 37,
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.bookmark,
                        size: 27,
                        color: Colors.white,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Text(
                      greeting(DateTime.now().hour),
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 45,
                      ),
                    )
                  ],
                ),
              ),

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
                child: CardSwiper(
                    allowedSwipeDirection:
                        AllowedSwipeDirection.only(left: false, right: true),
                    cardBuilder: (context, index, horizontalOffsetPercentage,
                            verticalOffsetPercentage) =>
                        dailyInspirationCardList[index],
                    cardsCount: dailyInspirationCardList.length),
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
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      'Recipes you may like',
                      style: TextStyle(
                        fontFamily: Constants.mainFont,
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1200,
                child: GridView.count(
                  //grid container width and height
                  childAspectRatio: 140 / 180,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                    12,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        shadowColor: Colors.black87,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Constants.CardColor,
                          ),
                          child: RecipesMayLikeCard(),
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
