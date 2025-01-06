import 'package:flutter/material.dart';

class DatePickerScreen extends StatefulWidget {
  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  final Set<String> _selectedDates = {};
  String _selectedDatesDisplay = "Anytime";

  void _updateSelectedDatesDisplay() {
    if (_selectedDates.isEmpty) {
      _selectedDatesDisplay = "Anytime";
    } else {
      final sortedDates = _selectedDates.toList()
        ..sort((a, b) {
          final aParts = a.split(' ');
          final bParts = b.split(' ');

          final months = {
            "January": 1,
            "February": 2,
            "March": 3,
            "April": 4,
            "May": 5,
            "June": 6,
            "July": 7,
            "August": 8,
            "September": 9,
            "October": 10,
            "November": 11,
            "December": 12,
          };

          final aMonth = months[aParts[0]]!;
          final bMonth = months[bParts[0]]!;
          final aDay = int.parse(aParts[1]);
          final bDay = int.parse(bParts[1]);

          if (aMonth != bMonth) {
            return aMonth.compareTo(bMonth);
          }
          return aDay.compareTo(bDay);
        });

      _selectedDatesDisplay = sortedDates.first;
    }
  }

  void _toggleDate(String date) {
    setState(() {
      if (_selectedDates.contains(date)) {
        _selectedDates.remove(date);
      } else {
        _selectedDates.add(date);
      }
      _updateSelectedDatesDisplay();
    });
  }

  void _toggleMonthSelection(String month, int daysInMonth) {
    setState(() {
      final monthDates = List.generate(
        daysInMonth,
        (index) => "$month ${index + 1}",
      );

      if (monthDates.every(_selectedDates.contains)) {
        _selectedDates.removeAll(monthDates);
      } else {
        _selectedDates.addAll(monthDates);
      }
      _updateSelectedDatesDisplay();
    });
  }

  bool isLeapYear(int year) {
    if (year % 4 != 0) return false;
    if (year % 100 == 0 && year % 400 != 0) return false;
    return true;
  }

  int getDaysInMonth(String month, int year) {
    switch (month) {
      case "January":
      case "March":
      case "May":
      case "July":
      case "August":
      case "October":
      case "December":
        return 31;
      case "April":
      case "June":
      case "September":
      case "November":
        return 30;
      case "February":
        return isLeapYear(year) ? 29 : 28;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final List<Map<String, dynamic>> months = [
      {"month": "January", "days": getDaysInMonth("January", currentYear)},
      {"month": "February", "days": getDaysInMonth("February", currentYear)},
      {"month": "March", "days": getDaysInMonth("March", currentYear)},
      {"month": "April", "days": getDaysInMonth("April", currentYear)},
      {"month": "May", "days": getDaysInMonth("May", currentYear)},
      {"month": "June", "days": getDaysInMonth("June", currentYear)},
      {"month": "July", "days": getDaysInMonth("July", currentYear)},
      {"month": "August", "days": getDaysInMonth("August", currentYear)},
      {"month": "September", "days": getDaysInMonth("September", currentYear)},
      {"month": "October", "days": getDaysInMonth("October", currentYear)},
      {"month": "November", "days": getDaysInMonth("November", currentYear)},
      {"month": "December", "days": getDaysInMonth("December", currentYear)},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Dates", style: TextStyle(fontSize: 18)),
        actions: [
          TextButton(
            onPressed: () {
              print("Search functionality can be added here.");
            },
            child: Text(
              "Search anytime",
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _selectedDatesDisplay,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add return"),
                        Icon(Icons.add, size: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey.shade800),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: months.length,
              itemBuilder: (context, index) {
                final monthData = months[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: MonthView(
                    month: monthData["month"] as String,
                    daysInMonth: monthData["days"] as int,
                    selectedDates: _selectedDates,
                    onDateToggle: _toggleDate,
                    onMonthToggle: _toggleMonthSelection,
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () {
                print("Selected Dates: $_selectedDates");
              },
              child: Text("Confirm", style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

// Ensure MonthView is defined correctly below
class MonthView extends StatelessWidget {
  final String month;
  final int daysInMonth;
  final Set<String> selectedDates;
  final Function(String) onDateToggle;
  final Function(String, int) onMonthToggle;

  const MonthView({
    required this.month,
    required this.daysInMonth,
    required this.selectedDates,
    required this.onDateToggle,
    required this.onMonthToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              month,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => onMonthToggle(month, daysInMonth),
              child: Text(
                "Select whole month",
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: daysInMonth,
          itemBuilder: (context, index) {
            final day = index + 1;
            final dateKey = "$month $day";
            final isSelected = selectedDates.contains(dateKey);

            return GestureDetector(
              onTap: () => onDateToggle(dateKey),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      isSelected ? Colors.lightBlueAccent : Colors.transparent,
                  border: Border.all(
                    color: isSelected
                        ? Colors.lightBlueAccent
                        : Colors.grey.shade700,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? Colors.white : Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(height: 4),
                    Icon(
                      Icons.search,
                      size: 16,
                      color: isSelected ? Colors.white : Colors.lightBlueAccent,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
