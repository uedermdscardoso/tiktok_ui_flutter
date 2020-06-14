
import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row( //Menu
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 5),
              Container(width: 40, height: 40, color: Colors.lightBlue),
              Container(width: 40, height: 40, color: Colors.lightBlue),
              Container(width: 40, height: 40, color: Colors.lightBlue),
              Container(width: 40, height: 40, color: Colors.lightBlue),
              Container(width: 40, height: 40, color: Colors.lightBlue),
              SizedBox(width: 5),
            ],
          ),
        ),
      ],
    );
  }
}
