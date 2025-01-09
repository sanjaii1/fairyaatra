import 'package:fairyaatra/src/feature/common/webview.dart';
import 'package:flutter/material.dart';

class FlightDetailsScreen extends StatefulWidget {
  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  int _selectedOption = 0; // 0: Return, 1: One Way, 2: Multi-City
  String fromLocation = "Bengaluru";
  String toLocation = "Indira Gandhi International";

  final List<Map<String, dynamic>> flightData = [
    {
      "from": "DEL",
      "to": "BLR",
      "airline": "Akasa Air",
      "flightNumber": "QP-1350",
      "departureTime": "09:55pm",
      "arrivalTime": "01:00am",
      "duration": "03h 05m",
      "date": "9 Jan, Thu"
    },
    {
      "from": "BLR",
      "to": "HYD",
      "airline": "IndiGo",
      "flightNumber": "6E-638",
      "departureTime": "06:50pm",
      "arrivalTime": "08:15pm",
      "duration": "01h 25m",
      "layover": "01h 15m",
      "layoverCity": "Hyderabad",
      "returnDate": "16 Jan, Thu",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          ...flightData.map((data) => _buildFlightCard(data)).toList(),
          const SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          surfaceTintColor: Colors.black,
          child: _buildPriceSection()),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.black,
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, size: 22),
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
          icon: const Icon(Icons.notifications_none, size: 22),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '09 Jan - 16 Jan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Text('1 Passenger, Economy', style: TextStyle(color: Colors.grey)),
          ],
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.filter_alt_outlined),
        // ),
      ],
    );
  }

  Widget _buildFlightCard(Map<String, dynamic> flight) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${flight["from"]} — ${flight["to"]}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              flight.containsKey("date")
                  ? 'Date: ${flight["date"]}'
                  : 'Return Date: ${flight["returnDate"]}',
              style: const TextStyle(color: Colors.grey),
            ),
            const Divider(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFlightDetail(
                  flight["departureTime"],
                  flight["from"],
                ),
                Column(
                  children: [
                    Text(
                      flight["airline"],
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 4),
                    Text(flight["flightNumber"],
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                _buildFlightDetail(
                  flight["arrivalTime"],
                  flight["to"],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Duration: ${flight["duration"]}',
                style: const TextStyle(color: Colors.grey)),
            if (flight.containsKey("layover"))
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  'Layover: ${flight["layover"]} in ${flight["layoverCity"]}',
                  style: const TextStyle(
                      color: Colors.grey, fontStyle: FontStyle.italic),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlightDetail(String time, String location) {
    return Column(
      children: [
        Text(
          time,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(location, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '₹12,144',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('via Goibibo', style: TextStyle(color: Colors.grey)),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            // Handle buy action
            _showProviderSelectionBottomSheet(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 113, 11, 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Select provider',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _showProviderSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (_, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pull indicator
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Select a Provider",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: providers.length,
                      itemBuilder: (context, index) {
                        final provider = providers[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[800],
                            child: Icon(
                              provider["icon"],
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            provider["name"],
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            provider["price"],
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          onTap: () {
                            // Handle provider selection logic here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebViewScreen(
                                  url: provider["url"],
                                ),
                              ),
                            ); // Close the bottom sheet
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  final List<Map<String, dynamic>> providers = [
    {
      "name": "Goibibo",
      "price": "₹12,144",
      "icon": Icons.flight,
      "url": "https://www.goibibo.com"
    },
    {
      "name": "MakeMyTrip",
      "price": "₹12,200",
      "icon": Icons.airplanemode_active,
      "url": "https://www.makemytrip.com"
    },
    {
      "name": "EaseMyTrip",
      "price": "₹11,950",
      "icon": Icons.luggage,
      "url": "https://www.easemytrip.com"
    },
  ];

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
}
