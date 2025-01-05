import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String label;
  final String code;
  final String city;

  const LocationWidget({
    Key? key,
    required this.label,
    required this.code,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
        Text(
          code,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(city, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }
}
