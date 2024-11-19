import 'package:flutter/material.dart';

Widget clickText({required String text, required VoidCallback ontap}) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 20, top: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: ontap,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.purple, decoration: TextDecoration.underline),
          // recognizer: TapGestureRecognizer()..onTap = ontap,
        ),
      ),
    ),
  );
}
