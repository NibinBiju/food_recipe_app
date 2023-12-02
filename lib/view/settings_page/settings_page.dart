import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/view/saved_recipe_page/saved_recipe_page.dart';
import 'package:recipe_app/view/settings_page/widgets/settings_card.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool onSlideButton = false;
  @override
  Widget build(BuildContext context) {
    var saveProvdier = Provider.of<SavePageProvider>(context);
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
            child: Image.asset(Constants.logo)),
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
                        '${saveProvdier.cookbooks.length}',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontFamily: Constants.mainFont,
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            //settings for preferrences
            Container(
              padding: EdgeInsets.all(14),
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Constants.CardColor,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Food Preferences',
                    style: TextStyle(
                      fontFamily: Constants.mainFont,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 27,
                  )
                ],
              ),
            ),

            //usual settings
            Container(
              padding: EdgeInsets.all(14),
              width: double.infinity,
              height: 430,
              decoration: BoxDecoration(
                  color: Constants.CardColor,
                  borderRadius: BorderRadius.circular(19)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Constants.primaryColor,
                            child: Center(
                              child: Icon(Icons.dark_mode),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontFamily: Constants.mainFont,
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),

                      //slide button
                      InkWell(
                        onTap: () {
                          onSlideButton = !onSlideButton;
                          setState(() {});
                        },
                        child: Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                            color:
                                onSlideButton ? Colors.blue : Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: onSlideButton
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              AnimatedContainer(
                                width: 30,
                                height: 30,
                                duration: Duration(milliseconds: 400),
                                decoration: BoxDecoration(
                                  color: onSlideButton
                                      ? Colors.grey.shade300
                                      : Constants.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 30,
                    endIndent: 10,
                    indent: 10,
                    thickness: 2,
                  ),
                  UsualSettingsCard(
                    settingsName: 'Notifications',
                    settingsIcon: Icon(Icons.notifications),
                  ),
                  UsualSettingsCard(
                      settingsName: 'Help & Support',
                      settingsIcon: Icon(Icons.question_mark_outlined)),
                  UsualSettingsCard(
                      settingsName: 'Terms and Conditions',
                      settingsIcon: Icon(Icons.description)),
                  UsualSettingsCard(
                      settingsName: 'About us',
                      settingsIcon: Icon(Icons.info_outline)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Constants.primaryColor,
                            child: Center(
                              child: Icon(Icons.star),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Rate us',
                            style: TextStyle(
                              fontFamily: Constants.mainFont,
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
