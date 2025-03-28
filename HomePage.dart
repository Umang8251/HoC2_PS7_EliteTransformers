import 'package:flutter/material.dart';
import 'RisksPage.dart'; // Import the RisksPage file

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/logo.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Blurred Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),

          // Page Content
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2), // Dynamic Spacing

              // "Hello, User!"
              Text(
                "Hello, Pavithra!",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),

              // Day Tracker Title
              Text(
                "Day Tracker / Calendar",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 20),

              // Feature Buttons (Scrollable to Prevent Overflow)
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildFeatureCard(Icons.calendar_today, "Day Tracker / Calendar"),
                      _buildFeatureCard(Icons.build, "Tools / Services"),
                      _buildFeatureCard(Icons.pregnant_woman, "Pregnancy Tracker"),
                      _buildFeatureCard(Icons.edit, "Log Current Data"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF8B5E83),
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom), // Fixes overflow
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _bottomNavItem(Icons.warning, "SOS", context),
              _bottomNavItem(Icons.bar_chart, "View Risks", context), // Navigate to RisksPage
              _bottomNavItem(Icons.explore, "Discover", context),
            ],
          ),
        ),
      ),
    );
  }

  // Feature Buttons
  Widget _buildFeatureCard(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          minimumSize: Size(double.infinity, 50),
        ),
        onPressed: () {},
        icon: Icon(icon, color: Colors.black),
        label: Text(text),
      ),
    );
  }

  // Bottom Navigation Icons with Navigation
  Widget _bottomNavItem(IconData icon, String text, BuildContext context) {
    return InkWell(
      onTap: () {
        if (text == "View Risks") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RisksPage()), // Navigate to RisksPage
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 5),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
