import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/constants/constants.dart';
import 'package:recipe_app/controller/save_page_provider/save_page_controller.dart';
import 'package:recipe_app/model/save_page_model/save_page_cookbook_model.dart';
import 'package:recipe_app/view/saved_recipe_page/widgets/save_recipes_card.dart';

class SavedRecipePage extends StatefulWidget {
  SavedRecipePage({
    super.key,
  });

  @override
  State<SavedRecipePage> createState() => _SavedRecipePageState();
}

class _SavedRecipePageState extends State<SavedRecipePage> {
  TextEditingController _cookbookTextfield = TextEditingController();
  CreateCookBookModel? cookBookModel;

  @override
  Widget build(BuildContext context) {
    var saveProvider = Provider.of<SavePageProvider>(context);
    final recipedemo =
        saveProvider.cookbooks.elementAt(saveProvider.recipeLength);
    final createCookBookModel =
        saveProvider.cookbooks[saveProvider.selectedIndex];
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Cookbooks',
                    style: TextStyle(
                      fontFamily: Constants.mainFont,
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                  saveProvider.selectedIndex == 0
                      ? CircleAvatar(
                          backgroundColor: Constants.primaryColor,
                          radius: 18,
                        )
                      : InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                height: 200,
                                color: Colors.green,
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.black45,
                            child: Center(
                              child: Icon(Icons.more_horiz_outlined),
                            ),
                          ),
                        ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    saveProvider.cookbooks.length + 1,
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 17,
                      ),
                      child: saveProvider.cookbooks.length == index

                          //add button to create new list
                          ? InkWell(
                              highlightColor: Constants.primaryColor,
                              onTap: () {
                                _cookbookTextfield.text = '';
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      width: 300,
                                      height: 220,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        color: Constants.CardColor,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TextField(
                                            controller: _cookbookTextfield,
                                            cursorColor: Colors.grey.shade600,
                                            style: TextStyle(
                                              fontFamily: Constants.mainFont,
                                              color: Colors.white,
                                              fontSize: 27,
                                            ),
                                            autofocus: true,
                                            decoration: InputDecoration(
                                              hintText: 'Cookbook name',
                                              hintStyle: TextStyle(
                                                color: Colors.grey.shade600,
                                              ),
                                              border: OutlineInputBorder(),
                                            ),
                                            onSubmitted: (value) {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          InkWell(
                                            //create cookbook
                                            onTap: () {
                                              saveProvider.createCookBook(
                                                CreateCookBookModel(
                                                  index: index,
                                                  cookBookName:
                                                      _cookbookTextfield.text,
                                                  recipes: [],
                                                ),
                                              );
                                              print('$index');
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              width: 140,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                color: Constants.buttonColor,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Create',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        Constants.mainFont,
                                                    fontSize: 23,
                                                    color: Colors.black87,
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
                              },
                              child: Container(
                                width: 140,
                                height: 110,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 42,
                                      backgroundColor: Constants.CardColor,
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 42,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Create new cookbook',
                                      style: TextStyle(
                                        fontFamily: Constants.mainFont,
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )

                          //recipes lists
                          : InkWell(
                              highlightColor: Colors.black12,
                              splashColor: Constants.primaryColor,
                              onTap: () {
                                saveProvider.selectedIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                width: 100,
                                height: 110,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 42,
                                      backgroundColor:
                                          saveProvider.selectedIndex == index
                                              ? Colors.white
                                              : Colors.grey,
                                      child: Center(
                                        child: CircleAvatar(
                                          radius: 38,
                                          backgroundColor:
                                              Constants.primaryColor,
                                          child: CircleAvatar(
                                            radius: 35,
                                            foregroundImage: AssetImage(
                                                'assets/images/Rectangle 17.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      saveProvider
                                              .cookbooks[index].cookBookName ??
                                          'N/a',
                                      style: TextStyle(
                                        fontFamily: Constants.mainFont,
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Column(
                children:
                    List.generate(createCookBookModel.recipes.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SavePageRecipeCard(
                      cookBookModel: saveProvider.cookbooks[index],
                      index: saveProvider.selectedIndex,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
