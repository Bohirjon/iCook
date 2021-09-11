import 'package:flutter/material.dart';

abstract class BaseNavigationService {
  Future showDialogAsync(String title, String message);
  void showMaterialBannerMessage(
      String message, Function dismissAction, String dismissActionLabel);
  Future navigate(Widget page);
}
