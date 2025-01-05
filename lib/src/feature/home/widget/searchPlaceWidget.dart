import 'package:flutter/material.dart';

class WhereFromPage extends StatelessWidget {
  const WhereFromPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background color
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Close the page
          },
        ),
        title: const Text(
          "Where from?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Input
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2F38),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.white70),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white70,
                      decoration: InputDecoration(
                        hintText: "From   Country, city or airport",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20),

            // // Current Location
            // const _SectionHeader(title: "Current location"),
            // const ListTile(
            //   leading: Icon(Icons.send, color: Colors.white),
            //   title: Text(
            //     "Current location",
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   subtitle: Text(
            //     "Use current location",
            //     style: TextStyle(color: Colors.white70),
            //   ),
            // ),
            const SizedBox(height: 20),

            // Recent Places
            const _SectionHeader(title: "Recent places"),
            const ListTile(
              leading: Icon(Icons.history, color: Colors.white),
              title: Text(
                "Kannur International (CNN)",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "India",
                style: TextStyle(color: Colors.white70),
              ),
            ),
            const SizedBox(height: 20),

            // Suggested Places
            const _SectionHeader(title: "Suggested places"),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.flight, color: Colors.white),
                    title: Text(
                      "Dubai (DXB)",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Airport · United Arab Emirates",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.flight, color: Colors.white),
                    title: Text(
                      "Mumbai (BOM)",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Airport · India",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.flag, color: Colors.white),
                    title: Text(
                      "India",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Country",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.flight, color: Colors.white),
                    title: Text(
                      "Indira Gandhi International (DEL)",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Airport · India",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.flight, color: Colors.white),
                    title: Text(
                      "Hyderabad (HYD)",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Airport · India",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.flight, color: Colors.white),
                    title: Text(
                      "Kolkata (CCU)",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Airport · India",
                      style: TextStyle(color: Colors.white70),
                    ),
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

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
