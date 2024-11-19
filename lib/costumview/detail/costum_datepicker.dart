import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class CostumDatePicker extends StatelessWidget {
  final String label;
  // final DateTime firstDate;
  // final DateTime lastDate;
  final DateTime? initialDate;
  final void Function(DateTime?) onDateSelected;

  const CostumDatePicker({
    super.key,
    required this.label,
    // required this.firstDate,
    // required this.lastDate,
    required this.initialDate,
    required this.onDateSelected
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        DateTimeFormField(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
          ),
          // firstDate: firstDate,
          // lastDate: lastDate,
          initialPickerDateTime: initialDate,
          mode: DateTimeFieldPickerMode.date,
          onChanged: onDateSelected
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
