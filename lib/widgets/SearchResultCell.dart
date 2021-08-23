import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icook/model/Recipe.dart';

class SearchRecipeResultCell extends StatelessWidget {
  const SearchRecipeResultCell({key, @required this.searchResult, this.onTap})
      : super(key: key);

  final Recipe searchResult;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(searchResult.title),
          subtitle: Text(searchResult.id.toString()),
          leading: Image.network(searchResult.image),
          trailing: Text(searchResult.id.toString()),
        ),
      ),
    );
  }
}
