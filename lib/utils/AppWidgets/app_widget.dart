import 'package:flutter/material.dart';

extension AppWidgetExtension on Widget {
  Widget noKeyboard() => GestureDetector(
    onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
    child: this,
  );
}