import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/model/save_page_model/save_page_cookbook_model.dart';
import 'package:recipe_app/view/details_page/details_page.dart';

class RecipesMayLikeCard extends StatelessWidget {
  const RecipesMayLikeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var saveProvider = Provider.of<SavePageProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsPage(imagepath: 'assets/images/Rectangle 34.png'),
            ));
      },
      child: Column(
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
                    onPressed: () {
                      saveProvider.addNewRecipe(SavedRecipes(
                          image: 'assets/images/Rectangle 34.png',
                          rating: '4.6',
                          recipeName: 'Pizza',
                          time: '30'));
                    },
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
      ),
    );
  }
}
