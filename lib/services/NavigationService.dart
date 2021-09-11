import 'package:icook/abstractions/BaseNavigationService.dart';
import 'package:icook/pages/FoodsSearchPage.dart';
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

  @override
  Future navigate(Widget page) {
    final materialRoute = MaterialPageRoute(builder: (context) => page);
    return Navigator.of(globalContext).push(materialRoute);
  }

  @override
  void showMaterialBannerMessage(
      String message, Function dismissAction, String dismissActionLabel) {
    ScaffoldMessenger.of(globalContext).showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        actions: [
          MaterialButton(
            onPressed: () {
              ScaffoldMessenger.of(globalContext).clearMaterialBanners();
              dismissAction();
            },
          ),
        ],
      ),
    );
  }
}
