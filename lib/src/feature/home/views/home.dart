import 'package:fairyaatra/src/feature/home/widget/dateCard.dart';
import 'package:fairyaatra/src/feature/home/widget/locationCard.dart';
import 'package:fairyaatra/src/feature/home/widget/recentSearchCard.dart';
import 'package:fairyaatra/src/feature/home/widget/travelersCard.dart';
import 'package:flutter/material.dart';

class FlightBookingPage extends StatefulWidget {
  const FlightBookingPage({super.key});

  @override
  _FlightBookingPageState createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightBookingPage> {
  // Track the selected button index
  int _selectedIndex = 1; // Default is "Round Trip"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flights"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToggleButtons(
                isSelected:
                    List.generate(3, (index) => index == _selectedIndex),
                borderRadius: BorderRadius.circular(8),
                selectedColor: Colors.white,
                fillColor: Colors.blue,
                color: Colors.black,
                constraints: const BoxConstraints(minWidth: 100, minHeight: 40),
                onPressed: (int index) {
                  setState(() {
                    _selectedIndex = index; // Update the selected index
                  });
                },
                children: const [
                  Text("ONE WAY"),
                  Text("ROUND TRIP"),
                  Text("MULTI-CITY"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  locationCard("From", "HRE", "Harare"),
                  const SizedBox(width: 8),
                  const Icon(Icons.swap_horiz, color: Colors.blue),
                  const SizedBox(width: 8),
                  locationCard("To", "JNB", "Johannesburg"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  dateCard("Departure", "29 Jan, 2025"),
                  const SizedBox(width: 8),
                  dateCard("Return", "05 Feb, 2025"),
                ],
              ),
              const SizedBox(height: 20),
              classAndTravellersCard(),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Search Flights"),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Recent Search",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              recentSearchCard("29 Jan 2025", "HRE", "JNB"),
            ],
          ),
        ),
      ),
    );
  }
}
