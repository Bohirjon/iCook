import 'package:ICook/Abstractions/BaseNavigationService.dart';
import 'package:ICook/Pages/FoodsSearchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService extends BaseNavigationService {
  @override
  Future showDialogAsync(String title, String message) {
    return showDialog(
      context: globalContext,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            FlatButton(
                onPressed: () => Navigator.of(context).pop(), child: Text('ok'))
          ],
        );
      },
    );
  }
}
