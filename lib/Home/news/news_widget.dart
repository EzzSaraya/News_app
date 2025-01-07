// import 'package:flutter/material.dart';
// import 'package:newss_app/Home/news/news_item.dart';
// import 'package:newss_app/Model/NewsResponse.dart';
// import 'package:newss_app/Model/SourceResponse.dart';
// import 'package:newss_app/api/api_manager.dart';
//
// import '../../appcolors.dart';
//
// class NewsWidget extends StatelessWidget {
//   NewsWidget({required this.source});
//   final Source source;
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<NewsResponse?>(
//       future: ApiManager.getNewsbySourceID(source.id ?? ''),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: Appcolors.GreenColor,
//             ),
//           );
//         } else if (snapshot.hasError ) {
//
//           //
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Something went wrong. Please try again later."),
//               ElevatedButton(
//                 onPressed: () {
//                   ApiManager.getNewsbySourceID(source.id ?? '');
//                 },
//                 child: Text("Try Again"),
//               ),
//             ],
//           );
//         }
//
//         // Handle API returning an error status
//         if (snapshot.data!.status != 'ok') {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(snapshot.data?.message ?? 'Unknown Error'),
//                 ElevatedButton(
//                   onPressed: () {
//                     ApiManager.getNewsbySourceID(source.id ?? '');
//                   },
//                   child: Text("Try Again"),
//                 ),
//               ],
//             ),
//           );
//         }
//
//         var newsList = snapshot.data!.articles!;
//         if (newsList == null || newsList.isEmpty) {
//           return Center(child: Text('No news available.'));
//         }
//
//         return ListView.builder(
//           itemBuilder: (context, index) {
//             return NewsItem(news: newsList[index]);
//           },
//           itemCount: newsList.length,
//         );
//       },
//     );
//   }
// }
//

















import 'package:flutter/material.dart';


import '../../Model/SourceResponse.dart';
import 'news_item.dart';



import 'package:newss_app/Model/NewsResponse.dart';
import 'package:newss_app/api/api_manager.dart';
import 'package:newss_app/appcolors.dart';


class NewsWidget extends StatefulWidget {
   Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsbySourceID(widget.source.id??""),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(

              child: CircularProgressIndicator(
                color: Appcolors.GreenColor,
              ),
            );
          }else if (snapshot.hasError){
            return Column(
              children: [
                const Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsbySourceID(widget.source.id??"");
                  setState(() {

                  });
                }, child: const Text('Try Again'))
              ],
            );
          }
          if(snapshot.data!.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsbySourceID(widget.source.id??'');
                  setState(() {

                  });
                }, child: const Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data!.articles!  ;
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: newsList[index],);
          },
            itemCount: newsList.length,
          );
        }
    );
  }
}