import 'package:icook/abstractions/BaseNavigationService.dart';
import 'package:icook/Pages/FoodsSearchPage.dart';
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
            MaterialButton(
                onPressed: () => Navigator.of(context).pop(), child: Text('ok'))
          ],
        );
      },
    );
  }
}
