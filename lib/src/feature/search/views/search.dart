import 'dart:ffi';

import 'package:fairyaatra/src/feature/searchDetail/view/searchDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlightListScreen extends StatefulWidget {
  @override
  _FlightListScreenState createState() => _FlightListScreenState();
}

class _FlightListScreenState extends State<FlightListScreen> {
  int _selectedOption = 0; // 0: Return, 1: One Way, 2: Multi-City
  String fromLocation = "Bengaluru";
  String toLocation = "Indira Gandhi International";
  final List<Map<String, dynamic>> flights = [
    {
      'airline': 'Air Kerala',
      'time': '11:10 AM - 5:30 PM',
      'stops': '1 stop',
      'duration': '6h 20m',
      'price': '₹8,076',
      'co2': '9%',
      'isFavorite': false,
    },
    {
      'airline': 'IndiGo',
      'time': '5:10 AM - 11:00 AM',
      'stops': '1 stop',
      'duration': '5h 50m',
      'price': '₹8,077',
      'co2': '9%',
      'isFavorite': false,
    },
    {
      'airline': 'Air India Express',
      'time': '7:35 PM - 10:55 PM',
      'stops': 'Direct',
      'duration': '3h 20m',
      'price': '₹12,100',
      'co2': '16%',
      'isFavorite': false,
    },
    {
      'airline': 'IndiGo',
      'time': '5:10 AM - 11:00 AM',
      'stops': '1 stop',
      'duration': '5h 50m',
      'price': '₹8,077',
      'co2': '9%',
      'isFavorite': false,
    },
    {
      'airline': 'Air India Express',
      'time': '7:35 PM - 10:55 PM',
      'stops': 'Direct',
      'duration': '3h 20m',
      'price': '₹12,100',
      'co2': '16%',
      'isFavorite': false,
    },
    {
      'airline': 'IndiGo',
      'time': '11:10 AM - 5:30 PM',
      'stops': '1 stop',
      'duration': '6h 20m',
      'price': '₹8,076',
      'co2': '9%',
      'isFavorite': false,
    },
    {
      'airline': 'IndiGo',
      'time': '5:10 AM - 11:00 AM',
      'stops': '1 stop',
      'duration': '5h 50m',
      'price': '₹8,077',
      'co2': '9%',
      'isFavorite': false,
    },
    {
      'airline': 'Air India Express',
      'time': '7:35 PM - 10:55 PM',
      'stops': 'Direct',
      'duration': '3h 20m',
      'price': '₹12,100',
      'co2': '16%',
      'isFavorite': false,
    },
    {
      'airline': 'IndiGo',
      'time': '5:10 AM - 11:00 AM',
      'stops': '1 stop',
      'duration': '5h 50m',
      'price': '₹8,077',
      'co2': '9%',
      'isFavorite': false,
    },
    {
      'airline': 'Air India Express',
      'time': '7:35 PM - 10:55 PM',
      'stops': 'Direct',
      'duration': '3h 20m',
      'price': '₹12,100',
      'co2': '16%',
      'isFavorite': false,
    },
  ];

  String selectedSort = "Best";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      //backgroundColor: Colors.black,
      body: Column(
        children: [
          // Sorting Info
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox.shrink(), // Placeholder for alignment
                TextButton.icon(
                  onPressed: () {
                    // Show sorting/filtering options
                    _showSortOptions();
                  },
                  icon: Icon(Icons.filter_alt_outlined,
                      size: 16, color: Colors.blue),
                  label: Text(
                    "Sort and filter",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "72 results sorted by $selectedSort",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
              ),
            ),
          ),
          // Sorting and Filter Row

          //Divider(color: Colors.grey.shade800, thickness: 1),
          // Sorting Buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSortButton("Best"),
                _buildSortButton("Fastest"),
                _buildSortButton("Cheapest"),
              ],
            ),
          ),
          // Divider(color: Colors.grey.shade800, thickness: 1),
          // Flight List
          Expanded(
            child: ListView.builder(
              itemCount: flights.length,
              itemBuilder: (context, index) {
                final flight = flights[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FlightDetailsScreen()),
                    );
                  },
                  child: FlightCard(
                    flight: flight,
                    onFavoriteToggle: () {
                      setState(() {
                        flight['isFavorite'] = !flight['isFavorite'];
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ToggleButtons(
                        isSelected: [
                          _selectedOption == 0,
                          _selectedOption == 1,
                          _selectedOption == 2,
                        ],
                        onPressed: (int index) {
                          setState(() {
                            _selectedOption = index;
                          });
                        },
                        color: Colors.grey,
                        selectedColor: Colors.white,
                        fillColor: Colors.transparent,
                        borderColor: Colors.transparent,
                        selectedBorderColor: Colors.transparent,
                        constraints: const BoxConstraints(minWidth: 80),
                        children: const [
                          Text("Return"),
                          Text("One way"),
                          Text("Multi-city"),
                        ],
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// Updated Section with Overlapping Arrow
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          _buildAirportSelector(
                              context, fromLocation, Icons.flight_takeoff),
                          const SizedBox(height: 16),
                          _buildAirportSelector(
                              context, toLocation, Icons.flight_land),
                        ],
                      ),
                      Positioned(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // Swap the locations
                              final temp = fromLocation;
                              fromLocation = toLocation;
                              toLocation = temp;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueAccent,
                            ),
                            child: const Icon(
                              Icons.swap_vert,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDateSelector(context, 'Tue, 14 Jan'),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildDateSelector(context, 'Tue, 21 Jan'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildPassengerSelector(context, '1 0 0'),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildClassSelector(context, 'Economy'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPassengerSelector(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.person, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
        ],
      ),
    );
  }

  Widget _buildClassSelector(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.airline_seat_recline_normal,
              color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
        ],
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_drop_down, color: Colors.white, size: 20),
        ],
      ),
    );
  }

  Widget _buildAirportSelector(
      BuildContext context, String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.black,
      //systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.black,
      primary: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, size: 22),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: GestureDetector(
        onTap: () => _showSearchBottomSheet(context),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "COK – BLR",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                  ),
                  Icon(
                    Icons.edit,
                    size: 14,
                    //size: 1,
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                "Jan 14",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none, size: 22),
          onPressed: () {
            //Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildSortButton(String filter) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSort = filter;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: selectedSort == filter
              ? const Color.fromARGB(255, 113, 11, 4)
              : Colors.grey.shade900,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          filter,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: selectedSort == filter ? Colors.white : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Sort Options",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                ListTile(
                  leading: Icon(Icons.star, color: Colors.blue),
                  title: Text("Sort by Best",
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    setState(() {
                      selectedSort = "Best";
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.flash_on, color: Colors.orange),
                  title: Text("Sort by Fastest",
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    setState(() {
                      selectedSort = "Fastest";
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.attach_money, color: Colors.green),
                  title: Text("Sort by Cheapest",
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    setState(() {
                      selectedSort = "Cheapest";
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FlightCard extends StatelessWidget {
  final Map<String, dynamic> flight;
  final VoidCallback onFavoriteToggle;

  const FlightCard({required this.flight, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Airline Name and Favorite Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(flight['airline'],
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: onFavoriteToggle,
                  child: Icon(
                    flight['isFavorite']
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: flight['isFavorite'] ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Flight Time
            Text(flight['time'], style: TextStyle(fontSize: 14)),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(flight['stops'],
                    style: TextStyle(color: Colors.redAccent, fontSize: 14)),
                Text(flight['duration'], style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 8),
            // CO2 Emission and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Emits ${flight['co2']} less CO2e",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text(flight['price'],
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
