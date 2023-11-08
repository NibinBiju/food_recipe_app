import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/constants/color_constants.dart';

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  final List carousalComponents = [
    ['assets/images/Rectangle 17 (1).png', 'Explore Recipes around the world'],
    ['assets/images/Rectangle 17.png', 'Create your Own Recipe'],
    ['assets/images/Rectangle 34.png', 'Search using Ingrediants'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CarouselSlider.builder(
                itemCount: carousalComponents.length,
                itemBuilder: (context, index, realIndex) => FittedBox(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: 357,
                        height: 400,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                                image: AssetImage(carousalComponents[index][0]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(120, 0, 0, 0),
                                borderRadius: BorderRadius.circular(22),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                carousalComponents[index][1],
                                style: TextStyle(
                                  fontFamily: Constants.mainFont,
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 50 / 49,
                )),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(120, 0, 0, 0),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Explore",
                        style: TextStyle(
                          fontFamily: Constants.mainFont,
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 38,
                          ))
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
