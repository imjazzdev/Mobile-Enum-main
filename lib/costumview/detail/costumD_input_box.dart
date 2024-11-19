import 'package:flutter/material.dart';

Widget DetailInputBox(
    {required String label,
    required String hint,
    required TextEditingController controller,
    bool inputangka = false}) {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      TextField(
        controller: controller,
        keyboardType:
            inputangka == true ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            labelText: label,
            // hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(
                  color: Colors.purple,
                  width: 2,
                ))),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
