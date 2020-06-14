
import 'package:flutter/material.dart';

class VideoLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(width: 60, height: 60, color: Colors.lightGreen),
            SizedBox(height: 42),
            Container(width: 60, height: 60, color: Colors.lightGreen),
            SizedBox(height: 35),
            Container(width: 60, height: 60, color: Colors.lightGreen),
            SizedBox(height: 35),
            Container(width: 60, height: 60, color: Colors.lightGreen),
            SizedBox(height: 70),
            Container(width: 60, height: 60, color: Colors.lightGreen),
          ],
        ),
      ),
    );
  }
}
