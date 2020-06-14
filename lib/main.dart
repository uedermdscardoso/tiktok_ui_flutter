
import 'package:flutter/material.dart';
import 'package:tiktokuiflutter/principal_page.dart';

void main() => runApp(TiktokUiApp());

class TiktokUiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tiktok UI Inspiration",
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: PrincipalPage(),
    );
  }
}
