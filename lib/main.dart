
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktokuiflutter/principal_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(TiktokUiApp());
}

class TiktokUiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tiktok UI Inspiration",
      theme: ThemeData(
          brightness: Brightness.dark
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
        ),
        child: PrincipalPage()
      ),
    );
  }
}
