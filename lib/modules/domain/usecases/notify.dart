import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';

class Notify {
  pop(BuildContext context, String text, IconData icon, Color color,
      String title) {
    return CherryToast(
      themeColor: color,
      icon: icon,
      title: title,
      titleStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      displayTitle: false,
      description: text,
      descriptionStyle: const TextStyle(fontSize: 14),
      animationType: ANIMATION_TYPE.fromLeft,
      animationDuration: const Duration(milliseconds: 400),
      autoDismiss: true,
      toastDuration: const Duration(milliseconds: 2200),
      displayCloseButton: false,
    ).show(context);
  }
}
