import 'package:flutter/material.dart';

// Separate Signup Page
class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // const Text(
          //   "Full Name",
          //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          // ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: "Full Name",
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10, // Reduces the height
                horizontal: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // const Text(
          //   "Email Address",
          //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          // ),
          //const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: "Email Address",
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10, // Reduces the height
                horizontal: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Signup",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
