import 'dart:convert';

import 'package:icook/AppConstants.dart';
import 'package:icook/abstractions/BaseFoodReceiptApi.dart';
import 'package:icook/model/SearchResultRoot.dart';
import 'package:http/http.dart' as http;

class FoodReceiptApi extends BaseFoodReceipt {
  Map<String, String> _headers;
  FoodReceiptApi() {
    _headers = Map<String, String>();
    _headers[ApiKey] = ApiKeyVallue;
    _headers[IncludeNutritionHeaderKey] = IncludeNutritionHeaderValue;
  }

  @override
  Future<SearchResultRoot> searchFood(String searchkey) async {
    var query =
        '?$ApiKey=$ApiKeyVallue&$IncludeNutritionHeaderKey=$IncludeNutritionHeaderValue&query=$searchkey';

    final uri = Uri.parse(FoodServiceHosturi + query);
    var response = await http.get(uri);
    if (response.statusCode != 200) {
      throw new Exception(response.reasonPhrase);
    }
    var jsonResponse = json.decode(response.body);
    var resullt = SearchResultRoot.fromJson(jsonResponse);
    return resullt;
  }
}
