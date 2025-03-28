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
              const SizedBox(height: 20),
              _buildPlacard("Your Health Status", "Moderate Risk: 35%", Colors.red.shade700),
              _buildPlacard("Systolic BP", "120 mmHg", Colors.blue.shade700),
              _buildPlacard("Diastolic BP", "80 mmHg", Colors.blue.shade700),
              _buildPlacard("Blood Sugar", "5.8 mmol/L", Colors.green.shade700),
              _buildPlacard("Heart Rate", "75 BPM", Colors.red.shade700),
              const SizedBox(height: 20),
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
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: color)),
        ],
      ),
    );
  }
}
