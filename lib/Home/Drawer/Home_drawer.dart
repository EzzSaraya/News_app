import 'package:flutter/material.dart';
import 'package:newss_app/appcolors.dart';

class HomeDrawer extends StatelessWidget {
Function onSideMenuItemClick;
static const int categories=1;
static const int settings=2;

HomeDrawer({required this.onSideMenuItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [

        Container(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.1),
        width: double.infinity,

        color: Appcolors.GreenColor,
        child: Text("News App!",style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,),



      ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(categories);

            },
            child: Row(
              children: [
                Icon(Icons.list,color: Appcolors.BlackColor,size:40,weight: 30,),
                Text("Categories",style: Theme.of(context).textTheme.titleSmall,)

              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(settings);

            },
            child: Row(
              children: [
                Icon(Icons.settings,color: Appcolors.BlackColor,size:40,weight: 30,),
                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                Text("Settings",style: Theme.of(context).textTheme.titleSmall,)

              ],
            ),
          ),
        )

      ],),
    ) ;

  }
}
