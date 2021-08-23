import 'package:icook/model/RecipeRoot.dart';

abstract class BaseFoodReceipt {
  Future<RecipeRoot> search(String searchkey);
}
