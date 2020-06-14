
import 'package:flutter/material.dart';
import 'package:tiktokuiflutter/video.dart';
import 'package:tiktokuiflutter/video_description.dart';
import 'package:tiktokuiflutter/video_lateral.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * .80,
            child: Column(
              children: <Widget>[
                Video(),
                VideoDescription(),
              ],
            ),
          ),
          VideoLateral(),
        ],
      ),
    );
  }
}
