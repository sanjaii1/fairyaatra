import 'package:fairyaatra/src/feature/home/widget/classSelectionWidget.dart';
import 'package:flutter/material.dart';

class HotelSearchPage extends StatefulWidget {
  const HotelSearchPage({super.key});

  @override
  State<HotelSearchPage> createState() => _HotelSearchPageState();
}

class _HotelSearchPageState extends State<HotelSearchPage> {
  final TextEditingController _locationController = TextEditingController();
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  String _travellerCount = "1 Adult";

  // Method to select a date
  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            primaryColor: Colors.red,
            colorScheme: const ColorScheme.dark(primary: Colors.red),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = picked;
          if (_checkOutDate != null && _checkOutDate!.isBefore(_checkInDate!)) {
            _checkOutDate =
                null; // Clear check-out date if it's before check-in
          }
        } else {
          _checkOutDate = picked;
        }
      });
    }
  }

  // Bottom sheet for traveler selection
  void _showTravellerSelection() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Travellers',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('1 Adult',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    _travellerCount = '1 Adult';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('2 Adults',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    _travellerCount = '2 Adults';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('3 Adults',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    _travellerCount = '3 Adults';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('1 Adult, 1 Child',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    _travellerCount = '1 Adult, 1 Child';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('2 Adults, 2 Children',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    _travellerCount = '2 Adults, 2 Children';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              'SEARCH PLACE',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _locationController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter City/Location',
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: const Icon(Icons.search, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CHECK-IN',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _checkInDate == null
                                ? 'Select Date'
                                : '${_checkInDate!.day}/${_checkInDate!.month}/${_checkInDate!.year}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CHECK-OUT',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _checkOutDate == null
                                ? 'Select Date'
                                : '${_checkOutDate!.day}/${_checkOutDate!.month}/${_checkOutDate!.year}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'TRAVELLERS',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const TravelersScreen()), // Replace with your logic
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _travellerCount,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const Icon(Icons.person, color: Colors.white),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add your search logic here
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.grey[900],
                    title: const Text(
                      'Search Details',
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Text(
                      'Location: ${_locationController.text}\n'
                      'Check-In: ${_checkInDate != null ? '${_checkInDate!.day}/${_checkInDate!.month}/${_checkInDate!.year}' : 'Not selected'}\n'
                      'Check-Out: ${_checkOutDate != null ? '${_checkOutDate!.day}/${_checkOutDate!.month}/${_checkOutDate!.year}' : 'Not selected'}\n'
                      'Travellers: $_travellerCount',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK',
                            style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 113, 11, 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'SEARCH HOTELS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
