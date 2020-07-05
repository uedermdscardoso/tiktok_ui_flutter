
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125,
      //color: Colors.cyan,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Following",
            style: TextStyle(
              color: Colors.white70, //Color(int.parse("FF747474",radix: 16)),
              fontSize: 17, decoration: TextDecoration.none, fontFamily: "Arial", fontWeight: FontWeight.normal
            ),
          ),
          SizedBox(width: 18),
          Text(
              "For you",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17, decoration: TextDecoration.none, fontFamily: "Arial", fontWeight: FontWeight.bold
              ),
          ),
        ],
      ),
    );
  }
}
