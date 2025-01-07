  import 'package:flutter/material.dart';
import 'package:newss_app/appcolors.dart';

class CategoryModel{
  String title;
  String imagepath;
  Color color;
  String id;

  CategoryModel({required this.title, required this.imagepath,required this.color , required this.id });



  static List<CategoryModel>  getCategories(){
    return
    [
    CategoryModel(title: "Sports", imagepath: "assets/images/sports.png",color: Appcolors.RedColor ,id: 'sports '),
    CategoryModel(title: " Politics", imagepath: "assets/images/Politics.png",color: Appcolors.BLueColor ,id: 'general'),
    CategoryModel(title: "Health", imagepath: "assets/images/health.png",color: Appcolors.PinkColor ,id: 'health '),
    CategoryModel(title: "Business", imagepath: "assets/images/bussines.png",color: Appcolors.BrownColor ,id: 'business'),
      CategoryModel(title: "Science", imagepath: "assets/images/science.png",color: Appcolors.YellowColor ,id: 'science '),
    CategoryModel(title: "Technology", imagepath: "assets/images/science.png",color: Appcolors.LightBlueColor ,id: 'technology'),
    CategoryModel(title: "Entertainment", imagepath: "assets/images/environment.png",color: Appcolors.PinkColor ,id: 'entertainment'),
];
  }



  }
