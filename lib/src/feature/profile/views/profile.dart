import 'package:fairyaatra/src/feature/profile/widget/menuItem.dart';
import 'package:fairyaatra/src/feature/profile/widget/sectionHeader.dart';
import 'package:flutter/material.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade100,
                        foregroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Text("Login / Signup"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Account and Settings Section
              sectionHeader("Your Account and Settings"),
              menuItem(context, Icons.book, "My Bookings", onPressed: () {}),
              menuItem(context, Icons.person, "My Travellers",
                  onPressed: () {}),
              menuItem(context, Icons.credit_card, "My Cards",
                  onPressed: () {}),
              menuItem(
                context,
                Icons.notifications,
                "Notifications",
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
                onPressed: () {}, // Fixed here
              ),
              menuItem(context, Icons.thumb_up, "Rate Our App",
                  onPressed: () {}),
              menuItem(context, Icons.language, "Country",
                  trailing: const Text("Global - USD"),
                  onPressed: () {}), // Fixed here

              const SizedBox(height: 20),

              // Support and Info Section
              sectionHeader("Support and Info"),
              menuItem(context, Icons.chat, "Send a Query", onPressed: () {}),
              menuItem(context, Icons.help, "FAQs", onPressed: () {}),
              menuItem(
                context,
                Icons.info,
                "About Travelstart",
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        "New",
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text("VER: 7.0.8"),
                  ],
                ),
                onPressed: () {}, // Fixed here
              ),
            ],
          ),
        ),
      ),
    );
  }
}
