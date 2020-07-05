
import 'package:flutter/material.dart';

class ButtonBottom extends StatelessWidget {

  IconData icon;
  String text;

  ButtonBottom({ this.icon, this.text });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, height: 50,
      //color: Colors.lightBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Colors.white, size: 18),
          SizedBox(height: 5),
          Text(text, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: "Arial", fontWeight: FontWeight.normal, decoration: TextDecoration.none))
        ],
      ),
    );
  }
}
