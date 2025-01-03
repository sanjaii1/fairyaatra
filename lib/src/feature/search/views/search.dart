import 'package:flutter/material.dart';

import '../widget/flightCard.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FlightSearchResultsPage(),
    );
  }
}

class FlightSearchResultsPage extends StatelessWidget {
  const FlightSearchResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
        title: const Text(
          "New York City, NY - Portland, OR",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            color: Colors.blue[700],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "29 Jan | 1 Traveller | Economy",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const Text(
                  "ONE-WAY",
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Countdown and Dates Section
          Container(
            color: Colors.blue[50],
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Please secure your booking within",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                Text(
                  "00:29:47",
                  style: TextStyle(
                    color: Colors.orange[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                5,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: index == 2 ? Colors.blue : Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Mon ${27 + index}",
                        style: TextStyle(
                          color: index == 2 ? Colors.blue : Colors.black87,
                        ),
                      ),
                      Text(
                        "USD 101",
                        style: TextStyle(
                          color: index == 2 ? Colors.blue : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Sorting Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "167 Results found",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.filter_list, color: Colors.blue),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.sort, color: Colors.blue),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Flight Cards
          Expanded(
            child: ListView(
              children: const [
                FlightCard(
                  tag: "Cheapest",
                  airline: "Delta Air Lines",
                  flightCode: "DL684",
                  departureTime: "19:59",
                  arrivalTime: "23:29",
                  duration: "6h 30m",
                  price: "USD 101",
                  isSelected: true,
                ),
                FlightCard(
                  tag: "Fastest",
                  airline: "United Airlines",
                  flightCode: "UA509",
                  departureTime: "17:20",
                  arrivalTime: "20:37",
                  duration: "6h 17m",
                  price: "USD 153",
                ),
                FlightCard(
                  airline: "Delta Air Lines",
                  flightCode: "DL2473",
                  departureTime: "14:00",
                  arrivalTime: "22:00",
                  duration: "8h 00m",
                  price: "USD 130",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
