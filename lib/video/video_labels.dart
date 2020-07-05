
import 'package:flutter/material.dart';
import 'package:tiktokuiflutter/domain/model/user.dart';
import 'package:tiktokuiflutter/video/video_description.dart';
import 'package:tiktokuiflutter/video/video_lateral.dart';

class VideoLabels extends StatelessWidget {

  bool isForYou;
  bool videoIsPlaying;
  User user;

  VideoLabels({ this.isForYou, this.videoIsPlaying, this.user });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * .80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                VideoDescription(
                    videoIsPlaying: videoIsPlaying,
                    screenUser: '@${this.user.screenUser}',
                    description: this.user.albums.elementAt(0).description,
                    albumName: this.user.albums.elementAt(0).name,
                ),
              ],
            ),
          ),
          VideoLateral(isForYou: this.isForYou, videoIsPlaying: videoIsPlaying, user: user),
        ],
      ),
    );
  }
}
