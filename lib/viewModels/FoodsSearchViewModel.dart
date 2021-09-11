import 'package:icook/abstractions/BaseFoodReceiptApi.dart';
import 'package:icook/abstractions/BaseNavigationService.dart';
import 'package:icook/model/RecipeRoot.dart';
import 'package:icook/pages/RecipeInformationPage.dart';
import 'package:rxdart/rxdart.dart';

class FoodsSearchViewModel {
  final BaseFoodReceipt _baseFoodReceipt;
  final BaseNavigationService _navigationService;

  final searchString = BehaviorSubject.seeded('');

  final searchResultRoot = BehaviorSubject<RecipeRoot>.seeded(null);
  final isLoading = BehaviorSubject<bool>.seeded(false);

  FoodsSearchViewModel(this._baseFoodReceipt, this._navigationService) {
    searchString
        .throttleTime(Duration(milliseconds: 750))
        .where((event) => event.isNotEmpty)
        .listen((event) async => searchFoods());
    searchString
        .where((event) => event.isEmpty)
        .listen((event) => clearFoods());
  }

  void dismiss() {
    print("dismiss pressed");
  }

  void searchFoods() async {
    isLoading.add(true);
    try {
      final result = await _baseFoodReceipt.search(searchString.value);
      searchResultRoot.add(result);
    } catch (e) {
      await _navigationService.showDialogAsync(
          'Error Loading foods', e.toString());
    } finally {
      isLoading.add(false);
    }
  }

  void clearFoods() {
    searchResultRoot.add(null);
  }

  void navigateRecipeInformation(int recipeId) async {
    final recipeIformationPage = RecipeInformationPage(recipeId);
    await _navigationService.navigate(recipeIformationPage);
  }
}
