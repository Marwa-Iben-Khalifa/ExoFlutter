import 'package:flutter/material.dart';
import 'package:orange_valley_caa/pages/details_page.dart';
import 'package:orange_valley_caa/pages/home_page.dart';
import 'package:orange_valley_caa/utils/helper.dart';

void main() {
  runApp(OrangeValleyApp());
}

class  OrangeValleyApp extends StatelessWidget {
  const OrangeValleyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

