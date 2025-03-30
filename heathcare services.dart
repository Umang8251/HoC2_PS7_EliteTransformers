import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MedicalHealthcarePage(),
    );
  }
}

class MedicalHealthcarePage extends StatelessWidget {
  const MedicalHealthcarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC599B6), // Background color
      appBar: AppBar(
        title: const Text("Medical Healthcare"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildOptionCard(
                "Schedule Online Consultation",
                "Book an appointment with a medical expert.",
                Icons.video_call,
                Colors.blue.shade700,
              ),
              _buildOptionCard(
                "Join Group Discussions",
                "Engage in health-related conversations.",
                Icons.group,
                Colors.green.shade700,
              ),
              _buildOptionCard(
                "Access Medical Records",
                "View and manage your medical history.",
                Icons.folder_open,
                Colors.orange.shade700,
              ),
              _buildOptionCard(
                "Health Tips & Updates",
                "Stay informed with the latest health news.",
                Icons.health_and_safety,
                Colors.purple.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
