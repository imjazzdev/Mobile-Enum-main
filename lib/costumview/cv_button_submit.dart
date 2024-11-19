import 'package:flutter/material.dart';

Widget submitButton({required String text, required VoidCallback ontap}){
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple[600]
      ),
      child: Text(
      
        text,
        style: TextStyle(color: Colors.white),
      )
    ),
  );
}