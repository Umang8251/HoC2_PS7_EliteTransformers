import 'package:flutter/material.dart';

class RisksPage extends StatelessWidget {
  const RisksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC599B6),
      appBar: AppBar(
        title: const Text("Health Risks"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with Circular Image and Profile Icon
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/logo.jpeg',
                      ), // Your logo
                      radius: 30,
                    ),
                    const Icon(Icons.person, color: Colors.white, size: 35),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Health Risk Placard
              _buildPlacard(
                "Your Health Status Today",
                "Moderate Risk: 35%",
                Colors.red.shade700,
              ),

              // Additional Health Vitals Placards
              _buildPlacard("Systolic BP", "120 mmHg", Colors.blue.shade700),
              _buildPlacard("Diastolic BP", "80 mmHg", Colors.blue.shade700),
              _buildPlacard("Blood Sugar", "5.8 mmol/L", Colors.green.shade700),
              _buildPlacard(
                "Body Temperature",
                "36.5°C",
                Colors.orange.shade700,
              ),
              _buildPlacard("BMI", "24.5", Colors.purple.shade700),
              _buildPlacard(
                "Previous Complications",
                "None",
                Colors.teal.shade700,
              ),
              _buildPlacard(
                "Preexisting Diabetes",
                "No",
                Colors.brown.shade700,
              ),
              _buildPlacard("Gestational Diabetes", "No", Colors.cyan.shade700),
              _buildPlacard("Mental Health", "Stable", Colors.pink.shade700),
              _buildPlacard("Heart Rate", "75 BPM", Colors.red.shade700),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create a uniform placard
  Widget _buildPlacard(String title, String value, Color color) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Monitor changes regularly for better health.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
