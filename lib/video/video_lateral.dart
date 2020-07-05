
import 'package:flutter/material.dart';
import 'package:tiktokuiflutter/Utilities/tik_tok_icons.dart';
import "dart:math" as math;

import 'package:tiktokuiflutter/domain/model/user.dart';

class VideoLateral extends StatefulWidget {

  bool isForYou;
  bool videoIsPlaying;
  User user;

  VideoLateral({ this.isForYou, this.videoIsPlaying, this.user });

  @override
  State<StatefulWidget> createState() => _VideoLateralState();
}

class _VideoLateralState extends State<VideoLateral> with SingleTickerProviderStateMixin {

  bool _scaleAddButton = false;
  double _widthAddButton = 20;
  double _heightAddButton = 20;

  AnimationController animateDiskController;

  @override
  void initState() {
    super.initState();
    animateDiskController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 7),
    );
  }

  @override
  Widget build(BuildContext context) {

    execAnimations(isPlaying: widget.videoIsPlaying);

    return Expanded(
      child: Container(
        //color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 52,
              height: 62,
              child: Stack(
               children: <Widget>[
                 Container(
                   width: 52,
                   height: 52,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(100),
                       color: Colors.white,
                       border: Border.all(width: 1.0, color: Color(int.parse("FFFFDFE0", radix: 16))),
                       image: DecorationImage(
                         fit: BoxFit.cover,
                         image: AssetImage("assets/images/${widget.user.photo}.jpg"), //female_profile_1.jpg
                       )
                   ),
                 ),
                 Opacity(
                   opacity: widget.isForYou ? 1 : 0,
                   child: Align(
                     alignment: Alignment.bottomCenter,
                     child: GestureDetector(
                       onTap: (){
                         setState(() {
                           _scaleAddButton = _scaleAddButton; //!_scaleAddButton;
                         });
                       },
                       child: Container(
                         width: _widthAddButton, //!_scaleAddButton ? 20 : 25,
                         height: _heightAddButton,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(100),
                             color: !_scaleAddButton ? Colors.white : Colors.pink,
                             image: DecorationImage(
                               fit: BoxFit.cover,
                               image: !_scaleAddButton ? AssetImage('assets/icons/add.png') : AssetImage("assets/icons/add-pink.png"),
                             ),
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
              ),
            ),
            SizedBox(height: 22),
            _showLateralButton(title: widget.user.albums.elementAt(0).likes, iconData: TikTokIcons.heart, sizeBoxHeight: 3), //6.8m
            SizedBox(height: 22),
            _showLateralButton(title: widget.user.albums.elementAt(0).comments, iconData: TikTokIcons.chat_bubble, sizeBoxHeight: 3), //34.1k
            SizedBox(height: 22),
            _showLateralButton(title: widget.user.albums.elementAt(0).shared, iconData: TikTokIcons.reply, sizeBoxHeight: 8), //500
            SizedBox(height: 70),
            AnimatedBuilder(
              animation: animateDiskController,
              builder: (BuildContext context, Widget _widget) {
                return new Transform.rotate(
                  angle: animateDiskController.value * 6.3,
                  child: _widget,
                );
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/johnlennon.jpg"),
                  ),
                  border: Border.all(width: 12.0, color: Color(int.parse("FF2C2C2C", radix: 16))),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }

  Widget _showLateralButton({IconData iconData, String title, double sizeBoxHeight }){
    return Container(
      width: 52,
      height: 62,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: <Widget>[
            Icon(iconData, color: Color(int.parse("FFE0E0E0", radix: 16)), size: 35),
            SizedBox(height: sizeBoxHeight),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 12.0, fontFamily: "Arial", fontWeight: FontWeight.normal, decoration: TextDecoration.none))
          ],
        ),
      ),
    );
  }

  void execAnimations({ bool isPlaying }){
    if(!isPlaying) {
      animateDiskController.stop();
    } else {
      animateDiskController.repeat();
    }
  }
}
