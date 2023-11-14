import 'package:flutter/material.dart';
import 'package:recipe_app/constants/constants.dart';

class UsualSettingsCard extends StatelessWidget {
  const UsualSettingsCard({
    super.key,
    required this.settingsName,
    required this.settingsIcon,
  });
  final String settingsName;
  final Icon settingsIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Constants.primaryColor,
                  child: Center(
                    child: settingsIcon,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  settingsName,
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
        Divider(
          height: 30,
          endIndent: 10,
          indent: 10,
          thickness: 2,
        )
      ],
    );
  }
}
