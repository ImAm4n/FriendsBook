import 'package:flutter/material.dart';

class ShowSnackBar {
  const ShowSnackBar({required this.content});

  final Widget content;

  SnackBar showSnackBar() => SnackBar(
    content: content,
    margin: const EdgeInsets.all(4.0),
    elevation: 4.0,
    backgroundColor: Colors.black,
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: Colors.white,
    duration: const Duration(seconds: 2),
  );
}
