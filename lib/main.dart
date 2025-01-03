import 'package:fairyaatra/src/feature/home/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlightBookingApp());
}

class FlightBookingApp extends StatelessWidget {
  const FlightBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlightBookingPage(),
    );
  }
}
