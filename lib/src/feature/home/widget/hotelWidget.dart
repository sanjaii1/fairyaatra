import 'package:fairyaatra/src/feature/home/widget/dateWidget.dart';
import 'package:fairyaatra/src/feature/home/widget/selectionHotelWidget.dart';
import 'package:flutter/material.dart';

class HotelSearchWidget extends StatelessWidget {
  const HotelSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          // Background Image and Search Field
          Stack(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/download.png'), // Replace with your asset path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                right: 20,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      hintText: "Kochi, Kerala, India",
                      suffixIcon: const Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Check-In and Check-Out Dates
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              DateWidget(label: "CHECK-IN", date: "04 Jan", day: "Saturday"),
              DateWidget(label: "CHECK-OUT", date: "05 Jan", day: "Sunday"),
            ],
          ),
          const SizedBox(height: 20),
          // Room, Adults, Children Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectionWidget(label: "Room", value: "1"),
              SelectionWidget(label: "Adults", value: "2"),
              SelectionWidget(label: "Children", value: "0"),
            ],
          ),
          const Spacer(),
          // Deals and Book Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Deals on Experiences",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Book"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Search Hotels Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "SEARCH HOTELS",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
