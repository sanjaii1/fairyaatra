import 'package:fairyaatra/src/feature/home/widget/dateWidget.dart';
import 'package:fairyaatra/src/feature/home/widget/detailWidget.dart';
import 'package:fairyaatra/src/feature/home/widget/locationWidget.dart';
import 'package:fairyaatra/src/feature/search/views/search.dart';
import 'package:flutter/material.dart';

class Flightsearchwidget extends StatelessWidget {
  const Flightsearchwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tabs: Flights, Hotels, Experiences
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "FLIGHTS",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "HOTELS",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              Text(
                "EXPERIENCES",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Trip Type: One Way, Round Trip, Multi-City
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "One way",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Round trip",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Multi-city",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // From and To Locations
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      LocationWidget(
                        label: "FROM",
                        code: "DEL",
                        city: "Delhi",
                      ),
                      Icon(Icons.swap_horiz, color: Colors.blue),
                      LocationWidget(
                        label: "TO",
                        code: "BLR",
                        city: "Bengaluru",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Departure and Return Dates
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DateWidget(
                        label: "DEPARTURE",
                        date: "09 Jan",
                        day: "Thursday",
                      ),
                      DateWidget(
                        label: "RETURN",
                        date: "16 Jan",
                        day: "Thursday",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Traveller and Class
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DetailWidget(label: "TRAVELLER", value: "1 Adult"),
                      DetailWidget(label: "CLASS", value: "Economy"),
                    ],
                  ),
                  const Spacer(),
                  // Hotel Deals and Search Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Direct Hotel Deals",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text("BOOK"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const FlightSearchResultsPage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin =
                                Offset(1.0, 0.0); // Start from the right
                            const end =
                                Offset.zero; // End at the current position
                            const curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
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
    );
  }
}
