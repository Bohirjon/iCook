import 'package:flutter/material.dart';
import 'package:icook/viewModels/RecipeIformationViewModel.dart';

class RecipeInformationPage extends StatelessWidget {
  final RecipeIformationViewModel _recipeInformationViewModel =
      RecipeIformationViewModel();
  RecipeInformationPage(int recipeId) {
    _recipeInformationViewModel.fetch(recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("salom this is recipeInformation page"),
      ),
    );
  }
}
