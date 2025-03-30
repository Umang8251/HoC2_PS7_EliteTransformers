import 'package:flutter/material.dart';

class PregnancyProgressPage extends StatelessWidget {
  const PregnancyProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC599B6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.jpg'),
                      radius: 30,
                    ),
                    const Icon(Icons.person, color: Colors.white, size: 35),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildPlacard("Pregnancy Week", "Week 20", Colors.red.shade700),
              _buildPlacard(
                "Baby's Growth",
                "6.5 inches, 10.5 oz",
                Colors.blue.shade700,
              ),
              _buildPlacard(
                "Fetal Heart Rate",
                "140 BPM",
                Colors.green.shade700,
              ),
              _buildPlacard("Mother’s Weight", "65 kg", Colors.orange.shade700),
              _buildPlacard(
                "Amniotic Fluid Level",
                "Normal",
                Colors.purple.shade700,
              ),
              _buildPlacard("Iron Levels", "Sufficient", Colors.teal.shade700),
              _buildPlacard("Blood Pressure", "Normal", Colors.brown.shade700),
              _buildPlacard("Sugar Levels", "Controlled", Colors.cyan.shade700),
              _buildPlacard(
                "Mental Well-being",
                "Stable",
                Colors.pink.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }

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
            "Track your pregnancy progress regularly.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
