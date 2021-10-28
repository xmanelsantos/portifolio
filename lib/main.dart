import 'package:flutter/material.dart';
import 'package:portifolio/constants.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portifólio - Emanuel Santos',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgDarkColor,
      ),
      home: HomeScreen(),
    );
  }
}
