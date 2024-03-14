import 'package:flutter/material.dart';
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
    return WillPopScope(
      onWillPop: () => Navigator.of(context).canPop() ? Future.value(true) : Popup.showCloseDialog(context),
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
