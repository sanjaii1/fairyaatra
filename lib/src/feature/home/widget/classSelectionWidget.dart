import 'package:flutter/material.dart';

class TravelersScreen extends StatefulWidget {
  const TravelersScreen({super.key});

  @override
  _TravelersScreenState createState() => _TravelersScreenState();
}

class _TravelersScreenState extends State<TravelersScreen> {
  String cabinClass = "Economy";
  int adults = 1;
  int children = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Travelers",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cabin class",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () => showCabinClassDialog(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[800]!),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[900],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cabinClass,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey),
            buildCounter(
              "Adults",
              "Age 16+",
              adults,
              onIncrement: () => setState(() => adults++),
              onDecrement: () =>
                  setState(() => adults = adults > 1 ? adults - 1 : 1),
            ),
            buildCounter(
              "Children",
              "Age 0 to 15",
              children,
              onIncrement: () => setState(() => children++),
              onDecrement: () =>
                  setState(() => children = children > 0 ? children - 1 : 0),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showCabinClassDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  "Economy",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    cabinClass = "Economy";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  "Business",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    cabinClass = "Business";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  "First Class",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    cabinClass = "First Class";
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

  Widget buildCounter(String title, String subtitle, int count,
      {required VoidCallback onIncrement, required VoidCallback onDecrement}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: Colors.white),
                onPressed: onDecrement,
                color: Colors.grey[800],
              ),
              Text(
                "$count",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: onIncrement,
                color: Colors.grey[800],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
