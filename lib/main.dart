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
                  _locationCard("From", "HRE", "Harare"),
                  const SizedBox(width: 8),
                  const Icon(Icons.swap_horiz, color: Colors.blue),
                  const SizedBox(width: 8),
                  _locationCard("To", "JNB", "Johannesburg"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  _dateCard("Departure", "29 Jan, 2025"),
                  const SizedBox(width: 8),
                  _dateCard("Return", "05 Feb, 2025"),
                ],
              ),
              const SizedBox(height: 20),
              _classAndTravellersCard(),
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
              _recentSearchCard("29 Jan 2025", "HRE", "JNB"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _locationCard(String label, String code, String city) {
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

  Widget _dateCard(String label, String date) {
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
              date,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _classAndTravellersCard() {
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
                    Text("Class",
                        style: TextStyle(color: Colors.grey.shade600)),
                    const SizedBox(height: 8),
                    const Text(
                      "Economy",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

  Widget _recentSearchCard(String date, String from, String to) {
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
}
