//47375537c36b489d8bd960f8ac285d13;
import 'package:argument_app/ScreenComents/cards_page.dart';
import 'package:argument_app/base/base_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ui Concepts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: BaseScreen(),
    );
  }
}
