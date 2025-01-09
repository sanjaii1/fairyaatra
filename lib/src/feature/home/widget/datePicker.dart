import 'package:flutter/material.dart';

class DatePickerScreen extends StatefulWidget {
  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _pickDateRange());
  }

  Future<void> _pickDateRange() async {
    final now = DateTime.now();
    final initialDateRange = DateTimeRange(
      start: now,
      end: now.add(Duration(days: 7)),
    );

    final pickedRange = await showDateRangePicker(
      context: context,
      firstDate: now, // Only allow dates from today onwards
      lastDate: DateTime(2100),
      initialDateRange: initialDateRange,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: Colors.white,
                secondary: Colors.blue,
                onPrimary: Colors.red,
                onSurface: Colors.white,
                onSecondaryFixedVariant: Colors.yellow,
                onSurfaceVariant: Colors.white),
          ),
          child: child!,
        );
      },
    );

    if (pickedRange != null) {
      Navigator.pop(context, pickedRange); // Return the selected date range
    } else {
      Navigator.pop(context); // Close the screen if no date range is selected
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
