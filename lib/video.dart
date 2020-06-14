
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width * .80,
        color: Colors.green,
      ),
    );
  }
}
