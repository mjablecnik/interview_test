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

  static info(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    await PopupDialog(context: context).message(
      title: title,
      message: message,
      type: PopupType.info,
    );
  }

  static warning(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    await PopupDialog(context: context).message(
      title: title,
      message: message,
      type: PopupType.warning,
    );
  }

  static error(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    await PopupDialog(context: context).message(
      title: title,
      message: message,
      type: PopupType.error,
    );
  }
}
