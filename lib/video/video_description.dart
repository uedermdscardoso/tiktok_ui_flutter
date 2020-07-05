
import 'package:flutter/material.dart';
import 'dart:async';

class VideoDescription extends StatefulWidget {

  bool videoIsPlaying;
  String screenUser;
  String description;
  String albumName;

  VideoDescription({ this.videoIsPlaying, this.screenUser, this.description, this.albumName });

  @override
  State<StatefulWidget> createState() => _VideoDescriptionState();
}

class _VideoDescriptionState extends State<VideoDescription> with SingleTickerProviderStateMixin  {

  ScrollController scrollCtrl = new ScrollController();
  AnimationController animateCtrl;

  @override
  void initState() {
    double offset = 0.0;
    super.initState();
    animateCtrl =
    new AnimationController(vsync: this, duration: Duration(seconds: 15))
      ..addListener(() {
        if (animateCtrl.isCompleted) animateCtrl.repeat();
        offset += 1.0;
        if (offset - 1 > scrollCtrl.offset) {
          offset = 0.0;
        }
        setState(() {
          scrollCtrl.jumpTo(offset);
        });
      });
    animateCtrl.forward();
  }

  @override
  void dispose() {
    animateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(!widget.videoIsPlaying)
      setState(() {
        animateCtrl.stop();
      });
    else
      setState(() {
        animateCtrl.repeat();
      });

    return Container(
      width: MediaQuery.of(context).size.width * .80,
      height: 70,
      //color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: 18,
                child: Text(
                    widget.screenUser,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Arial", decoration: TextDecoration.none)
                ),
            ),
            SizedBox(height: 5),
            Container(
                width: double.infinity,
                height: 18,
                child: Text(
                    widget.description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15, fontFamily: "Arial", fontWeight: FontWeight.normal, decoration: TextDecoration.none)
                ),
            ),
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: 18,
              child: Row(
                children: <Widget>[
                  Icon(Icons.music_note, size: 15, color: Colors.white),
                  Container(
                    width: 160,
                    padding: EdgeInsets.only(top: 2),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: scrollCtrl,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Text(
                                      widget.albumName+"       ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12, fontFamily: "Arial", fontWeight: FontWeight.normal, decoration: TextDecoration.none)
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
