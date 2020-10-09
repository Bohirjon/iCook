import 'dart:convert';

import 'package:ICook/Abstractions/BaseFoodReceiptApi.dart';
import 'package:ICook/AppConstants.dart';
import 'package:ICook/Model/SearchResultRoot.dart';
import 'package:http/http.dart' as http;

class FoodReceiptApi extends BaseFoodReceipt {
  Map<String, String> _headers;
  FoodReceiptApi() {
    _headers = Map<String, String>();
    _headers[ApiKey] = ApiKeyVallue;
    _headers[IncludeNutritionHeaderKey] = IncludeNutritionHeaderValue;
  }

  @override
  Future<SearchResultRoot> searchFood(String searchKey) async {
    var query =
        '?$ApiKey=$ApiKeyVallue&$IncludeNutritionHeaderKey=$IncludeNutritionHeaderValue&query=$searchKey';
    var response = await http.get(FoodServiceHosturi + query);
    if (response.statusCode != 200) {
      throw new Exception(response.reasonPhrase);
    }
    var jsonResponse = json.decode(response.body);
    var resullt = SearchResultRoot.fromJson(jsonResponse);
    return resullt;
  }
}
