import 'package:flutter/material.dart';
import 'package:recipe_app/constants/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.primaryColor,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          backgroundColor: Constants.primaryColor,
          title: Container(
            padding: EdgeInsets.only(left: 10),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Color(0xFFD9D9D9),
            ),
            child: TextField(
              cursorColor: Constants.primaryColor,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    size: 32,
                    color: Constants.primaryColor,
                  ),
                  hintText: 'search recipes',
                  hintStyle: TextStyle(
                    color: Constants.CardColor,
                    fontSize: 24,
                  )),
              style: TextStyle(
                fontSize: 24,
                fontFamily: Constants.mainFont,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: GridView.count(
          childAspectRatio: 100 / 120,
          crossAxisCount: 2,
          children: List.generate(
              18,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: Constants.CardColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 155,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              color: Constants.primaryColor,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Rectangle 34.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
        ));
  }
}
