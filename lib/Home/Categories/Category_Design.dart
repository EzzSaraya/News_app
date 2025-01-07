
import 'package:flutter/material.dart';
import 'Category.dart';

class Item_design extends StatelessWidget {
  CategoryModel category;
int index;

   Item_design({required this.category,required this.index,});





  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(index %2 !=0 ? 25:0) ,
            bottomLeft: Radius.circular(index %2 ==0 ? 25:0)  ,
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),


          )
      ),
      child: Column(


        children: [
          Image.asset(category.imagepath,
          height: MediaQuery.of(context).size.height*0.15,),
          Text(category.title,style: Theme.of(context).textTheme.titleSmall,),

        ],

      )
      ,
    );
  }}
