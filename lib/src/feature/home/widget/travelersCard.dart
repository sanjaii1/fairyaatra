import 'package:flutter/material.dart';

Widget classAndTravellersCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Class", style: TextStyle(color: Colors.grey.shade600)),
                  const SizedBox(height: 8),
                  const Text(
                    "Economy",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Travellers",
                      style: TextStyle(color: Colors.grey.shade600)),
                  const SizedBox(height: 8),
                  const Text(
                    "1 Adult",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
