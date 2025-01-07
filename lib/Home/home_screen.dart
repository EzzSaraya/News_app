import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newss_app/Home/Categories/Category.dart';
import 'package:newss_app/Home/Categories/Category_details.dart';
import 'package:newss_app/Home/Categories/Category_fragment.dart';
import 'package:newss_app/Home/Drawer/Home_drawer.dart';
import 'package:newss_app/Home/settings/settingstab.dart';
import 'package:newss_app/Home/tabs/tab_widget.dart';
import 'package:newss_app/Model/SourceResponse.dart';
import 'package:newss_app/api/api_manager.dart';
import 'package:newss_app/appcolors.dart';

import 'news_search/search_delagate.dart';

class HomeScreen extends StatefulWidget {
  static String routename = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Appcolors.WhiteColor,
        child: Image.asset("assets/images/background.png",
            height: double.infinity, width: double.infinity, fit: BoxFit.fill),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            actions: [
              Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.04),
                  child: IconButton(
                      onPressed: () => showSearch(context: context,delegate: NewsSearchDelagate() ),
                      icon: Icon(
                        Icons.search_sharp,
                        size: 40,
                      )))
            ],
            iconTheme: IconThemeData(color: Appcolors.WhiteColor, size: 35),
            backgroundColor: Appcolors.GreenColor,
            centerTitle: true,
            title: Text(
              selectedItem == HomeDrawer.settings
                  ? "Settings"
                  : selectedcategory == null
                      ? "News App"
                      : selectedcategory!.title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Appcolors.WhiteColor),
            )),
        drawer: Drawer(
          backgroundColor: Appcolors.WhiteColor,
          child: HomeDrawer(
            onSideMenuItemClick: onSideMenuItemClick,
          ),
        ),
        body: selectedItem == HomeDrawer.settings
            ? SettingsTab()
            : selectedcategory == null
                ? CategoryFragment(onCategoryItemClick: onCategoryItemClicked)
                : CategoryDetails(category: selectedcategory!),
      )
    ]);
  }

  CategoryModel? selectedcategory;

  void onCategoryItemClicked(CategoryModel newCategory) {
    selectedcategory = newCategory;
    setState(() {});
  }

  int selectedItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newselected) {
    selectedItem = newselected;
    selectedcategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
