
import 'package:flutter/material.dart';
import 'package:tiktokuiflutter/Utilities/tik_tok_icons.dart';
import 'package:tiktokuiflutter/widgets/button_bottom.dart';

class MenuBottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row( //Menu
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.35))
          ),
          //color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 5),
                ButtonBottom(icon: TikTokIcons.home, text: 'Home'),
                ButtonBottom(icon: TikTokIcons.search, text: 'Discover'),
                Column(
                  children: <Widget>[
                    Container(
                      width: 50, height: 32,
                      //color: Colors.lightBlue,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 7.0),
                            width: 45,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 250, 45, 108),
                                borderRadius: BorderRadius.circular(7.0)
                          )),
                          Container(
                            margin: EdgeInsets.only(right: 7.0),
                            width: 45,
                            decoration: BoxDecoration(
                               color: Color.fromARGB(255, 32, 211, 234),
                               borderRadius: BorderRadius.circular(7.0)
                          )),

                          Center(child:Container(
                            width: 42,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7.0)
                            ),
                            child: Icon(Icons.add, size: 20.0,),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
                ButtonBottom(icon: TikTokIcons.messages, text: 'Inbox'),
                ButtonBottom(icon: TikTokIcons.profile, text: 'Me'),
                SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
