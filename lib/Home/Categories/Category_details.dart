import 'package:flutter/material.dart';
import 'package:newss_app/Home/Categories/Category.dart';
import 'package:newss_app/Home/news/news_item.dart';
import 'package:newss_app/Home/tabs/tab_widget.dart';
import 'package:newss_app/Model/NewsResponse.dart';
import 'package:newss_app/Model/SourceResponse.dart';
import 'package:newss_app/api/api_manager.dart';

import '../../appcolors.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({required this.category});
   CategoryModel category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getsources(widget.category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Appcolors.GreenColor,
              ),
            );
          } else if (snapshot.hasError ) {
            print("Category ID: ${widget.category.id}");
            print("Error: ${snapshot.error}");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Error: ${snapshot.error}"),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Reload data
                      ApiManager.getsources(widget.category.id);
                    });


                  },
                  child: Text("Try Again"),
                ),
              ],
            );
          }

          if (snapshot.data!.status != 'ok') {
            print("API Error: ${snapshot.data!.message}");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data!.message! ),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getsources(widget.category.id);
                    setState(() {

                    });
                  },
                  child: Text("Try Again"),
                ),
              ],
            );
          }
          // if (snapshot.data == null || snapshot.data!.sources == null|| snapshot.data!.sources!.isEmpty) {
          //   return Center(child: Text('No sources available.'));
          // }

          var SourcesList = snapshot.data!.sources!;
          if (SourcesList == null || SourcesList.isEmpty) {
            return Center(child: Text('No news available.'));
          }

              return TabWidget(sourcesList: SourcesList);



        }

    );
  }
}

