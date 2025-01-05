import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final String label;
  final String date;
  final String day;

  const DateWidget({
    Key? key,
    required this.label,
    required this.date,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(day, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
