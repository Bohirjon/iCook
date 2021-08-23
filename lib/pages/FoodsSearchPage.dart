import 'package:icook/model/RecipeRoot.dart';
import 'package:icook/viewModels/FoodsSearchViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icook/widgets/SearchResultCell.dart';

BuildContext globalContext;

class FoodsSearchPage extends StatelessWidget {
  final FoodsSearchViewModel _foodsSearchViewModel;
  FoodsSearchPage(this._foodsSearchViewModel);
  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return Scaffold(
      appBar: AppBar(
        leading: StreamBuilder<bool>(
          stream: _foodsSearchViewModel.isLoading,
          builder: (context, snapshot) => snapshot.data
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircularProgressIndicator(),
                )
              : Icon(
                  Icons.food_bank_outlined,
                  color: Colors.blueGrey,
                ),
        ),
        title: _searchWidget(context),
        centerTitle: true,
      ),
      body: _foodsListWidget(context),
    );
  }

  Widget _searchWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: TextField(
              onChanged: (value) =>
                  _foodsSearchViewModel.searchString.add(value),
              decoration: InputDecoration(
                hintText: 'Search for foood receipts',
                border: InputBorder.none,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          StreamBuilder<String>(
              stream: _foodsSearchViewModel.searchString,
              builder: (context, snapshot) {
                return IconButton(
                  onPressed: snapshot.data.isNotEmpty
                      ? _foodsSearchViewModel.searchFoods
                      : null,
                  icon: Icon(
                    Icons.search,
                    color: Colors.blueGrey,
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget _foodsListWidget(BuildContext context) {
    return StreamBuilder<RecipeRoot>(
      stream: _foodsSearchViewModel.searchResultRoot,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.results.length > 0) {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: snapshot.data.results.length,
            itemBuilder: (BuildContext context, int index) {
              var searchResult = snapshot.data.results.elementAt(index);
              return SearchRecipeResultCell(
                  searchResult: searchResult,
                  onTap: () => _foodsSearchViewModel
                      .navigateRecipeInformation(searchResult.id));
            },
          );
        } else {
          return Center(
              heightFactor: 2,
              child: Text(
                'No Items',
                style: TextStyle(color: Colors.grey),
              ));
        }
      },
    );
  }
}
