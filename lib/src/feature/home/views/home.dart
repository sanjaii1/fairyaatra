import 'package:fairyaatra/src/feature/home/widget/flightSearchWidget.dart';
import 'package:fairyaatra/src/feature/home/widget/hotelWidget.dart';

import 'package:fairyaatra/src/feature/home/widget/sidebar.dart';

import 'package:flutter/material.dart';

class FlightSearchPage extends StatefulWidget {
  const FlightSearchPage({Key? key}) : super(key: key);

  @override
  State<FlightSearchPage> createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  int _selectedIndex = 0; // Keeps track of the active tab

  // List of pages for navigation
  final List<Widget> _pages = [
    const Flightsearchwidget(),
    const HotelSearchWidget(),
    const Flightsearchwidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        //leading: const Icon(Icons.menu),
        title: const Text(
          "fairyaatra",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   //icon: const Icon(Icons.account_circle),
          // ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update the selected tab
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: "Flights",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hotel),
            label: "Hotels",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Experiences",
          ),
        ],
      ),
    );
  }
}
