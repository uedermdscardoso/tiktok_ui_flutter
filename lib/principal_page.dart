import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 125,
          color: Colors.yellow,
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .80,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .80,
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .80,
                      height: 150,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        Row( //Menu
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.grey,
            ),
          ],
        )
      ],
    );
  }
}
