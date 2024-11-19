import 'package:flutter/material.dart';

class CostumCard extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final Color iconBColor;
  final String title;
  final String subtitle;

  const CostumCard({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.iconBColor,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      // height: 200,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 45,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: iconBColor
              ),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Ubah sesuai kebutuhan
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54, // Ubah sesuai kebutuhan
            ),
          ),
        ],
      ),
    );
  }
}
