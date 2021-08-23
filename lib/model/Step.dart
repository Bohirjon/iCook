import 'Ingredeints.dart';

class Steps {
  int number;
  String step;
  List<Ingredients> ingredients;
  Steps({this.number, this.step, this.ingredients});

  Steps.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    step = json['step'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients.add(new Ingredients.fromJson(v));
      });
    }
  }
}
