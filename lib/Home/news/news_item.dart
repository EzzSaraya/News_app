import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newss_app/Home/news/news_details.dart';
import 'package:newss_app/Home/news/news_widget.dart';

import '../../Model/NewsResponse.dart';
import '../../appcolors.dart';

class NewsItem extends StatelessWidget {

  News news;



  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(NewsDetails.routename, arguments: news);

      },
      child: Container(clipBehavior:  Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), // Added decoration with border radius
      color: Appcolors.WhiteColor,),
        padding:EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
        ClipRRect(
        borderRadius : BorderRadius.circular(25),
        child: CachedNetworkImage(

          imageUrl: news.urlToImage??'',
          width: double.infinity,
          height:  MediaQuery.of(context).size.height*0.3,
          fit: BoxFit.fill,
          placeholder: (context, url) => CircularProgressIndicator(

            color: Appcolors.GreenColor,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        ),
         Text(news.author??'',style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 19),),
              SizedBox(height: 8,),
              Text(news.title??'',style: Theme.of(context). textTheme.titleSmall!.copyWith(fontSize: 20),),
              SizedBox(height: 10,),
              Text(news.publishedAt??'',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Appcolors.GreyColor),textAlign: TextAlign.end),

        ],
      ),),
    );
  }
}
