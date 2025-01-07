import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Model/NewsResponse.dart';
import '../../appcolors.dart';

class NewsDetails extends StatelessWidget {
  static String routename = 'NewsDetails';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute
        .of(context)!
        .settings
        .arguments as News;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Appcolors.WhiteColor, size: 35),
        title: Text(
          "${news.title}",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
      ),
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          // Added decoration with border radius
          color: Appcolors.WhiteColor,
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    CircularProgressIndicator(
                      color: Appcolors.GreenColor,
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(
              news.author ?? '',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 19),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              news.title ?? '',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(news.publishedAt ?? '',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Appcolors.GreyColor),
                textAlign: TextAlign.end),
            SizedBox(height: 10,),
            Text("${news.content}", style: Theme
                .of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 18)),
            Spacer(),
            Row(

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {
                  _launchUrl(news.url);
                },
                  child: Text("Full View Article", style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,),
                ),
                Icon(Icons.navigate_next_rounded, color: Appcolors.BlackColor,
                  size: 30,)

              ],
            )
          ],

        ),
      ),
    );
  }

  Future<void> _launchUrl(newsUrl) async {
    final Uri _url = Uri.parse(newsUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

}

