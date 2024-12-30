import 'package:flutter/material.dart';
import '../model/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quán Ăn Vặt',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: FoodShopHomePage(),
    );
  }
}
