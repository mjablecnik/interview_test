import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_test/popup.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop(true);
        } else {
          final bool shouldPop = await Popup.showCloseDialog(context);
          if (shouldPop) SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: child,
        ),
      ),
    );
  }
}
