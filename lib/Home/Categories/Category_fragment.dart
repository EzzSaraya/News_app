import 'package:flutter/material.dart';
import 'package:newss_app/Home/Categories/Category_Design.dart';
import 'package:newss_app/appcolors.dart';
import 'Category.dart';

class CategoryFragment extends StatelessWidget {
  var categorieslist = CategoryModel.getCategories();
  Function onCategoryItemClick;

  CategoryFragment({required this.onCategoryItemClick});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, backgroundColor: Colors.transparent,
        title: Text("Pick your Category of interest", style: Theme
            .of(context)
            .textTheme
            .titleLarge!
            .copyWith(
            fontWeight: FontWeight.bold, color: Appcolors.BlackColor),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return InkWell(onTap: () {
              onCategoryItemClick(categorieslist[index]);
            },
                child: Item_design(
                    category: categorieslist[index], index: index));
          }, itemCount: categorieslist.length,),
      ),

    );
  }
}
