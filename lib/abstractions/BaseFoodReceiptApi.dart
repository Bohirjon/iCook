import 'package:icook/model/RecipeInformation.dart';
import 'package:icook/model/RecipeRoot.dart';

abstract class BaseFoodReceipt {
  Future<RecipeRoot> search(String searchkey);
  Future<RecipeInformation> getRecipeInformation(int recipeId);
}
