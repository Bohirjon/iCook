import 'package:flutter/material.dart';
import 'package:icook/abstractions/BaseFoodReceiptApi.dart';
import 'package:icook/apis/FoodReceiptApi.dart';
import 'package:icook/apis/mocks/MockFoodReceiptApi.dart';
import 'package:icook/pages/FoodsSearchPage.dart';
import 'package:icook/services/NavigationService.dart';
import 'package:icook/viewModels/FoodsSearchViewModel.dart';

void main() {
  runApp(MyApp());
}

const bool useMock = true;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BaseFoodReceipt foodReceipt;
    if (useMock) {
      foodReceipt = MockFoodReceiprtApi();
    } else {
      foodReceipt = FoodReceiptApi();
    }
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: FoodsSearchPage(
        FoodsSearchViewModel(
          foodReceipt,
          NavigationService(),
        ),
      ),
    );
  }
}
