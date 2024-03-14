import 'package:flutter/material.dart';
import 'package:vader_popup/vader_popup.dart';

class Popup {
  static Future<bool> showCloseDialog(BuildContext context) async {
    final result = await PopupDialog(context: context).question(
      title: "Exit application",
      message: "Are you sure you want to quit the application?",
      type: PopupType.warning,
      confirmButton: PopupButton(
        label: "Yes",
        color: Colors.purple.shade300,
        onPressed: () => Navigator.of(context).pop(true),
      ),
      cancelButton: PopupButton(
        label: "No",
        color: Colors.grey.withOpacity(0.6),
        onPressed: () => Navigator.of(context).pop(false),
      ),
    );

    return result ?? false;
  }
}
