import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black, // Set background color to black
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drawer Header
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 2, 4),
                    Color.fromARGB(255, 17, 17, 17),
                    Color.fromARGB(255, 72, 5, 5),
                  ],
                  stops: [0.0, 0.5, 1.0],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                    child: Text(
                      "R",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Ram",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "rsr665@gmail.com",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Drawer Items
            Expanded(
              child: ListView(
                children: const [
                  _DrawerItem(
                    icon: Icons.flight,
                    title: "Flight Booking",
                  ),
                  _DrawerItem(
                    icon: Icons.hotel,
                    title: "Hotel Booking",
                  ),
                  _DrawerItem(
                    icon: Icons.assignment,
                    title: "Visa",
                  ),
                  _DrawerItem(
                    icon: Icons.sim_card,
                    title: "eSIM",
                  ),
                  _DrawerItem(
                    icon: Icons.explore,
                    title: "Experiences",
                  ),
                  _DrawerItem(
                    icon: Icons.travel_explore,
                    title: "Nomad",
                  ),
                  _DrawerItem(
                    icon: Icons.flight_takeoff,
                    title: "Track a Flight",
                  ),
                  _DrawerItem(
                    icon: Icons.history,
                    title: "History",
                  ),
                  _DrawerItem(
                    icon: Icons.local_offer,
                    title: "Offers",
                  ),
                  Divider(color: Colors.white54),
                  _DrawerItem(
                    icon: Icons.settings,
                    title: "Settings",
                  ),
                  _DrawerItem(
                    icon: Icons.support_agent,
                    title: "Support",
                    trailingIcon: Icons.open_in_new,
                  ),
                  _DrawerItem(
                    icon: Icons.help,
                    title: "FAQ",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final IconData? trailingIcon;

  const _DrawerItem({
    Key? key,
    required this.icon,
    required this.title,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.red), // Set icon color to red
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16, color: Colors.white), // Text color white
      ),
      trailing: trailingIcon != null
          ? Icon(trailingIcon, color: Colors.red, size: 16) // Trailing icon red
          : null,
      onTap: () {
        // Define actions on tapping each item
        Navigator.pop(context); // Close the drawer
      },
    );
  }
}
