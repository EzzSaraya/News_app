import 'package:flutter/material.dart';
import 'package:newss_app/Home/tabs/tab_item.dart';

import '../../Model/SourceResponse.dart';
import '../news/news_widget.dart';

class TabWidget extends StatefulWidget {
  
List<Source> sourcesList ;
TabWidget({required this.sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

        length: widget.sourcesList.length, child: Column(
          children: [
            TabBar(
                   isScrollable: true,


                  onTap : (index){
             selectedindex= index;
             setState(() {} );
                },
                  indicatorColor: Colors.transparent,
                  tabs: widget.sourcesList.map((source)=> TabItem(isselected: selectedindex== widget.sourcesList.indexOf(source), source: source)

                ).toList()),
            SizedBox(height: 10,),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedindex]))
          ],
        ),

    );

  }
}
