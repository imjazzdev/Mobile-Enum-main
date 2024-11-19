import 'package:flutter/material.dart';

Widget inputBox({required String label, required String hint, required TextEditingController controller}){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.5
        ) 
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2
        )
      )
    ),
  );
}