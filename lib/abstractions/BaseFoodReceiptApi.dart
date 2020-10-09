import 'package:ICook/Model/SearchResultRoot.dart';

abstract class BaseFoodReceipt {
  Future<SearchResultRoot> searchFood(String searchkey);
}
