// ignore: avoid_web_libraries_in_flutter

import 'package:ICook/Apis/FoodReceiptApi.dart';
import 'package:ICook/Pages/FoodsSearchPage.dart';
import 'package:ICook/Services/NavigationService.dart';
import 'package:ICook/ViewModels/FoodsSearchViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.white)),
      home: FoodsSearchPage(
        FoodsSearchViewModel(
          FoodReceiptApi(),
          NavigationService(),
        ),
      ),
    );
  }
}
