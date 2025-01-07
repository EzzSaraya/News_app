import 'package:flutter/material.dart';

import '../../Model/NewsResponse.dart';
import '../../api/api_manager.dart';
import '../../appcolors.dart';
import '../news/news_item.dart';

class NewsSearchDelagate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => showResults(context), icon: Icon(Icons.search_sharp))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.pop(context);
    }, icon: Icon(Icons.close_sharp));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.SearchNews(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Appcolors.GreenColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Text('Something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.SearchNews(query);
                    },
                    child: const Text('Try Again'))
              ],
            );
          }
          if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.SearchNews(query);
                    },
                    child: const Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(
                news: newsList[index],
              );
            },
            itemCount: newsList.length,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Center(child: Text("Suggestions"));
    }
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.SearchNews(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Appcolors.GreenColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Text('Something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.SearchNews(query);
                    },
                    child: const Text('Try Again'))
              ],
            );
          }
          if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.SearchNews(query);
                    },
                    child: const Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(
                news: newsList[index],
              );
            },
            itemCount: newsList.length,
          );
        });

  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        primaryColor: Appcolors.GreenColor,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Appcolors.GreenColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45)))),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)));
  }
}

