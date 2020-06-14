import 'package:flutter/material.dart';
import 'package:tiktokuiflutter/body.dart';
import 'package:tiktokuiflutter/header.dart';
import 'package:tiktokuiflutter/menu_bottom.dart';
import 'package:tiktokuiflutter/video_lateral.dart';

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.purple,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.yellow,
          ),
        ),
        Column(
          children: <Widget>[
            Header(),
            Body(),
            MenuBottom()
          ],
        ),

        //Header(),
        //Body(),
        //MenuBottom(),
      ],
    );
  }
}
