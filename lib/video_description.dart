
import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .80,
      height: 75,
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Container(width: double.infinity, height: 15, color: Colors.purple),
          SizedBox(height: 15),
          Container(width: double.infinity, height: 15, color: Colors.purple),
          SizedBox(height: 15),
          Container(width: double.infinity, height: 15, color: Colors.purple),
        ],
      ),
    );
  }
}
