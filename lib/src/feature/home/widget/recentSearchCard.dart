import 'package:flutter/material.dart';

Widget recentSearchCard(String date, String from, String to) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Row(
      children: [
        Text(
          date,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text("$from ➔ $to", style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}
