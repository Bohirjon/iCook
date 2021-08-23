import 'package:flutter/material.dart';
import 'package:icook/apis/FoodReceiptApi.dart';
import 'package:icook/pages/FoodsSearchPage.dart';
import 'package:icook/services/NavigationService.dart';
import 'package:icook/viewModels/FoodsSearchViewModel.dart';

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
