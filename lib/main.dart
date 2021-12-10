import 'package:flutter/material.dart';
import 'package:orange_valley_caa/pages/details_page.dart';
import 'package:orange_valley_caa/pages/home_page.dart';
import 'package:orange_valley_caa/utils/helper.dart';

void main() {
  runApp(OrangeValleyApp());
}

class  OrangeValleyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      
    );
  }
}

