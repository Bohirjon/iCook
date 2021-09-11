import 'package:flutter/material.dart';
import 'package:icook/apis/FoodReceiptApi.dart';
import 'package:icook/apis/mocks/MockFoodReceiptApi.dart';
import 'package:icook/main.dart';
import 'package:icook/model/RecipeInformation.dart';
import 'package:icook/viewModels/RecipeInformationViewModel.dart';

class RecipeInformationPage extends StatelessWidget {
  final RecipeInformationViewModel _recipeInformationViewModel =
      RecipeInformationViewModel(
          useMock ? MockFoodReceiprtApi() : FoodReceiptApi());

  RecipeInformationPage(int recipeId) {
    print("info page is initializing");
    _recipeInformationViewModel.fetch(recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: null,
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: StreamBuilder<RecipeInformation>(
          stream: _recipeInformationViewModel.recipeInformationSubject.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final name = snapshot.data.title;
              return Text("data loaded $name");
            }
            return Text("salom this is recipeInformation page");
          },
        ),
      ),
    );
  }

  Widget _recipeBody() {}
}
