import 'dart:convert';

import 'package:icook/AppConstants.dart';
import 'package:icook/abstractions/BaseFoodReceiptApi.dart';
import 'package:http/http.dart' as http;
import 'package:icook/model/RecipeInformation.dart';
import 'package:icook/model/RecipeRoot.dart';
import 'package:icook/extensions/httpExtensions.dart';

class FoodReceiptApi extends BaseFoodReceipt {
  Map<String, String> _headers;
  FoodReceiptApi() {
    _headers = Map<String, String>();
    _headers[ApiKey] = ApiKeyVallue;
    _headers[IncludeNutritionHeaderKey] = IncludeNutritionHeaderValue;
  }

  @override
  Future<RecipeRoot> search(String searchkey) async {
    var query =
        'complexSearch?$ApiKey=$ApiKeyVallue&$IncludeNutritionHeaderKey=$IncludeNutritionHeaderValue&query=$searchkey';

    final uri = Uri.parse(FoodServiceHosturi + query);
    var response = await http.get(uri);
    response.ensureStatusOk();
    var jsonResponse = json.decode(response.body);
    var resullt = RecipeRoot.fromJson(jsonResponse);
    return resullt;
  }

  @override
  Future<RecipeInformation> getRecipeInformation(int recipeId) async {
    final query = '$recipeId/information?ApiKey=$ApiKeyVallue';
    final uri = Uri.parse(FoodServiceHosturi + query);
    final response = await http.get(uri);
    response.ensureStatusOk();

    final jsonResponse = json.decode(response.body);
    final recipeInformation = RecipeInformation.fromJson(jsonResponse);
    return recipeInformation;
  }
}
