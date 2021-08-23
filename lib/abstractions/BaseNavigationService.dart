import 'package:flutter/material.dart';

abstract class BaseNavigationService {
  Future showDialogAsync(String title, String message);
  Future navigate(Widget page);
}
