import 'package:flutter/material.dart';

void Snacker(
    String title, GlobalKey<ScaffoldMessengerState> aa, BuildContext context) {
  final snackBar = SnackBar(
      elevation: 3,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      width: MediaQuery.of(context).size.width / 1.5,
      duration: const Duration(seconds: 4),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xffE1E3FF),
      content: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 13),
      ));

  aa.currentState?.showSnackBar(snackBar);
  // messangerKey.currentState?.showSnackBar(snackBar);
}
