import 'package:flutter/material.dart';
import 'package:recipe_app/constants/constants.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.imagepath});

  final String imagepath;
  final List ingredientsList = [
    [
      'https://blog-images-1.pharmeasy.in/blog/production/wp-content/uploads/2021/04/23175719/shutterstock_440493100-1.jpg',
      'carrot'
    ],
    [
      'https://www.eatingwell.com/thmb/qxo-LeEo8OadDzr6wzbTLEO7PAQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/EW-Step-by-Step-CutUpChicken-Shot-1-1244-dbb9cb26dc984f7aa31ef9a12a40393f.jpg',
      'chicken'
    ],
    [
      'https://img1.exportersindia.com/product_images/bc-full/2022/3/6227120/fresh-red-onion-1646139971-6224721.jpeg',
      'onion'
    ],
    [
      'https://exoticvegetablespune.com/wp-content/uploads/2020/11/Frozen-Green-Peas-removebg-preview.png',
      'green pieace'
    ],
    ['https://cdn.britannica.com/27/122027-050-EAA86783/Butter.jpg', 'buttor'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  //recipe image
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imagepath),
                                fit: BoxFit.cover)),
                      ),
                      //main body
                      Container(
                        width: double.infinity,
                        height: 90,
                        color: Constants.primaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'About recipe',
                                style: TextStyle(
                                  fontFamily: Constants.mainFont,
                                  color: Colors.white,
                                  fontSize: 27,
                                ),
                              ),
                            ),
                            Text(
                              '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took.''',
                              style: TextStyle(
                                fontFamily: Constants.mainFont,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),

                              //total time card
                              child: Container(
                                  width: double.infinity,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19),
                                    border: Border.all(
                                      width: 2,
                                      color:
                                          const Color.fromARGB(255, 59, 59, 59),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            '30 min',
                                            style: TextStyle(
                                              fontFamily: Constants.mainFont,
                                              fontSize: 27,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            'Total time',
                                            style: TextStyle(
                                              fontFamily: Constants.mainFont,
                                              fontSize: 24,
                                              color: const Color.fromARGB(
                                                  255, 170, 170, 170),
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              width: double.infinity,
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 8, bottom: 8),
                                    child: Text(
                                      'Nutrition Per Saving',
                                      style: TextStyle(
                                        fontFamily: Constants.mainFont,
                                        color: Colors.white,
                                        fontSize: 27,
                                      ),
                                    ),
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'CALORIES',
                                              style: TextStyle(
                                                fontFamily: Constants.mainFont,
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 9,
                                            ),
                                            Text(
                                              '200',
                                              style: TextStyle(
                                                fontFamily: Constants.mainFont,
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            )
                                          ],
                                        ),
                                        VerticalDivider(
                                          width: 20,
                                          thickness: 1,
                                          color: const Color.fromARGB(
                                              255, 170, 170, 170),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'CALORIES',
                                              style: TextStyle(
                                                fontFamily: Constants.mainFont,
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 9,
                                            ),
                                            Text(
                                              '200',
                                              style: TextStyle(
                                                fontFamily: Constants.mainFont,
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            )
                                          ],
                                        ),
                                        VerticalDivider(
                                          width: 20,
                                          thickness: 1,
                                          color: const Color.fromARGB(
                                              255, 170, 170, 170),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'CALORIES',
                                              style: TextStyle(
                                                fontFamily: Constants.mainFont,
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 9,
                                            ),
                                            Text(
                                              '200',
                                              style: TextStyle(
                                                fontFamily: Constants.mainFont,
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            )
                                          ],
                                        ),
                                        VerticalDivider(
                                          width: 20,
                                          thickness: 1,
                                          color: const Color.fromARGB(
                                              255, 170, 170, 170),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'CALORIES',
                                              style: TextStyle(
                                                fontFamily: Constants.mainFont,
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 9,
                                            ),
                                            Text(
                                              '200',
                                              style: TextStyle(
                                                fontFamily: Constants.mainFont,
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Ingredients',
                                style: TextStyle(
                                  fontFamily: Constants.mainFont,
                                  color: Colors.white,
                                  fontSize: 27,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Constants.CardColor,
                              ),

                              //ingredients list
                              child: Column(
                                children: List.generate(
                                  ingredientsList.length,
                                  (index) => Column(
                                    children: [
                                      ListTile(
                                        leading: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                ingredientsList[index][0])),
                                        title: Text(
                                          ingredientsList[index][1],
                                          style: TextStyle(
                                            fontFamily: Constants.mainFont,
                                            color: const Color.fromARGB(
                                                255, 202, 202, 202),
                                            fontStyle: FontStyle.italic,
                                            fontSize: 26,
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        endIndent: 20,
                                        indent: 20,
                                        color: const Color.fromARGB(
                                            255, 170, 170, 170),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            //directions
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                'Directions',
                                style: TextStyle(
                                  fontFamily: Constants.mainFont,
                                  color: Colors.white,
                                  fontSize: 27,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Constants.CardColor,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '''Step 1
                             Make chilli garlic butterIn a small bowl, add butter. The butter need not be melted but must be at room temperature. Now add red chilli flakes, grated garlic and chopped coriander leaves. Give a good mix to combine the ingredients.
                            
 Step 2
                             Make liquid doughIn a large mixing bowl, add wheat flour and salt as per taste. Now add 1 cup of water in batches and mix well to form a thick and lump-free batter.

Step 3
                             Mix in butter mixture
                            Now add the butter mixture to the liquid dough and give a good mix to make the final mixture.
 
 Step 4
                             Make parathas
                            Heat a non-stick tawa well. Now pour 2 ladles of the liquid dough on the tawa and spread in circular motions to give it the shape of a paratha. Let it cook from one side, then flip towards the other side. Smear oil and again flip towards the other side. Press all the sides of the paratha using a spatula to make it cook evenly.
 
 Step 5
                             Ready to be served
                            Your Chilli Garlic Paratha is now ready to be served. Enjoy!''',
                                    style: TextStyle(
                                      fontFamily: Constants.mainFont,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  //app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          child: Center(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: CircleAvatar(
                              backgroundColor: Colors.black54,
                              child: Center(
                                child: IconButton(

                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },

                                    icon: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40),
                            child: CircleAvatar(
                              backgroundColor: Colors.black54,
                              child: Center(
                                child: IconButton(


                                    //save recipe
                            

                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },

                                    icon: Icon(
                                      Icons.bookmark_border_outlined,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  //floating card
                  Positioned(
                    top: 340,
                    left: 29,
                    child: Container(
                      width: 340,
                      height: 120,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 10,
                          )
                        ],
                        color: Constants.CardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'recipe',
                                style: TextStyle(
                                  fontFamily: Constants.mainFont,
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'Recipe name',
                                style: TextStyle(
                                  fontFamily: Constants.mainFont,
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontFamily: Constants.mainFont,
                                    fontSize: 19,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
