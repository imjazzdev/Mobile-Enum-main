import 'package:flutter/material.dart';

class RegionDropdownCostum extends StatelessWidget {
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?) onChanged;
  final String hint;
  final String label;

  const RegionDropdownCostum({
    super.key,
    this.value,
    required this.items,
    required this.onChanged,
    required this.hint,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final validValue = items.any((item) => item.value == value) ? value : null;

    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.purple, width: 2),
            ),
            labelText: label,
            hintText: hint,
          ),
          value: validValue,
          items: items,
          onChanged: onChanged,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

