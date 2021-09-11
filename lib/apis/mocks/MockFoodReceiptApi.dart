import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:icook/abstractions/BaseFoodReceiptApi.dart';
import 'package:icook/model/RecipeInformation.dart';
import 'package:icook/model/RecipeRoot.dart';

class MockFoodReceiprtApi extends BaseFoodReceipt {
  String get _infoJsonPath => "assets/mock_json/receiptInformation.json";
  String get _searchJsonPath => "assets/mock_json/searchResult.json";
  Future<String> _loadJsonFile(String path) {
    final json = rootBundle.loadString(path);
    return json;
  }

  @override
  Future<RecipeRoot> search(String searchkey) async {
    await Future.delayed(Duration(milliseconds: 240));
    var jsonString = await _loadJsonFile(_searchJsonPath);
    var jsonDecoded = json.decode(jsonString);
    var result = RecipeRoot.fromJson(jsonDecoded);
    return result;
  }

  @override
  Future<RecipeInformation> getRecipeInformation(int recipeId) async {
    await _simulate();
    final jsonString = await _loadJsonFile(_infoJsonPath);
    final decoded = json.decode(jsonString);
    final result = RecipeInformation.fromJson(decoded);
    return result;
  }

  Future _simulate() {
    return Future.delayed(Duration(milliseconds: 240));
  }
}
