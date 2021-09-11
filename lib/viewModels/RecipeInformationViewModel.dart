import 'package:icook/abstractions/BaseFoodReceiptApi.dart';
import 'package:icook/model/RecipeInformation.dart';
import 'package:rxdart/subjects.dart';

class RecipeInformationViewModel {
  final BaseFoodReceipt _foodRecipeApi;
  final recipeInformationSubject = BehaviorSubject<RecipeInformation>();

  RecipeInformationViewModel(this._foodRecipeApi);

  void fetch(int id) async {
    final recipeInformation = await _foodRecipeApi.getRecipeInformation(id);
    recipeInformationSubject.sink.add(recipeInformation);
  }

  dispose() {
    recipeInformationSubject.close();
  }
}
