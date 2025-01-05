import 'package:fairyaatra/src/feature/home/widget/dateWidget.dart';
import 'package:fairyaatra/src/feature/home/widget/detailWidget.dart';
import 'package:fairyaatra/src/feature/home/widget/locationWidget.dart';
import 'package:flutter/material.dart';

class Flightsearchwidget extends StatefulWidget {
  const Flightsearchwidget({Key? key}) : super(key: key);

  @override
  State<Flightsearchwidget> createState() => _FlightsearchwidgetState();
}

class _FlightsearchwidgetState extends State<Flightsearchwidget> {
  int _selectedTripType = 0; // 0 = One Way, 1 = Round Trip, 2 = Multicity

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 30),
          // Trip Type Toggle
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTripTypeButton("One Way", 0),
                _buildTripTypeButton("Round Trip", 1),
                _buildTripTypeButton("Multicity", 2),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Main Content
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // FROM and TO Locations
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        LocationWidget(
                          label: "FROM",
                          code: "DEL",
                          city: "Delhi",
                        ),
                        Icon(Icons.swap_horiz, color: Colors.red),
                        LocationWidget(
                          label: "TO",
                          code: "BLR",
                          city: "Bengaluru",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Departure and Return Dates
                    if (_selectedTripType == 0 || _selectedTripType == 1) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const DateWidget(
                            label: "DEPARTURE",
                            date: "09 Jan",
                            day: "Thursday",
                          ),
                          if (_selectedTripType ==
                              1) // Show RETURN for Round Trip
                            const DateWidget(
                              label: "RETURN",
                              date: "16 Jan",
                              day: "Thursday",
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                    // Traveller and Class Details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        DetailWidget(label: "TRAVELLER", value: "1 Adult"),
                        DetailWidget(label: "CLASS", value: "Economy"),
                      ],
                    ),
                    const Spacer(),
                    // Search Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle Search Button Logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "SEARCH FLIGHTS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripTypeButton(String label, int index) {
    final isSelected = _selectedTripType == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTripType = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.red : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
