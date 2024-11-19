import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class CostumTimePicker extends StatelessWidget {
  final String label;
  final DateTime? initialTime;
  final void Function(DateTime?) onTimeSelected;
  const CostumTimePicker({
    super.key,
    required this.label,
    required this.initialTime,
    required this.onTimeSelected,
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
                borderSide: const BorderSide(color: Colors.grey, width: 1.5)),
          ),
          initialPickerDateTime: initialTime,
          mode: DateTimeFieldPickerMode.time,
          onChanged: onTimeSelected,
          // use24hFormat: true,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
