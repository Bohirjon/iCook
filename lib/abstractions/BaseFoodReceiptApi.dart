import 'package:icook/model/SearchResultRoot.dart';

abstract class BaseFoodReceipt {
  Future<SearchResultRoot> searchFood(String searchkey);
}
