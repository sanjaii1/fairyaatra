import 'package:flutter/material.dart';

Widget locationCard(String label, String code, String city) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 8),
          Text(
            code,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(city, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    ),
  );
}
