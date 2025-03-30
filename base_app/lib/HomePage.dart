import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'RisksPage.dart';
import 'Pregnancy_Progress.dart';
import 'LogData.dart';
import 'ToolsServicesPage.dart';
import 'SOSPage.dart';
import 'DiscoverPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLanguage = "en"; // Default: English
  String translatedText = "Hello, New Mother!";

  // Google Translate API Key
  static const String apiKey = "AIzaSyDY7qtG9hGoLRY4Vl3R2YnDawNJ-9jY43s";
  static const String baseUrl = "https://translation.googleapis.com/language/translate/v2";

  Future<void> _translateText(String text, String targetLanguage) async {
    final response = await http.post(
      Uri.parse('$baseUrl?key=$apiKey'),
      body: {'q': text, 'target': targetLanguage},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        translatedText = data['data']['translations'][0]['translatedText'];
      });
    } else {
      setState(() {
        translatedText = "Translation Failed";
      });
    }
  }

  void _changeLanguage(String? newLanguage) {
    if (newLanguage != null) {
      _translateText("Hello, New Mother!", newLanguage);
      setState(() {
        selectedLanguage = newLanguage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8B5E83),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "GlowMamma",
              style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'Cursive'),
            ),
            DropdownButton<String>(
              value: selectedLanguage,
              dropdownColor: Colors.white,
              icon: Icon(Icons.language, color: Colors.white),
              items: [
                DropdownMenuItem(value: "en", child: Text("English")),
                DropdownMenuItem(value: "hi", child: Text("Hindi")),
                DropdownMenuItem(value: "fr", child: Text("French")),
                DropdownMenuItem(value: "es", child: Text("Spanish")),
              ],
              onChanged: _changeLanguage,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset("assets/logo.jpg", fit: BoxFit.cover),
          ),

          // Blurred Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),

          // Page Content
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),

              // Translated Text (Hello message)
              Text(
                translatedText,
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),

              // Feature Buttons (Scrollable)
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      
                      _buildFeatureCard(Icons.build, "Tools / Services", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ToolsServicesPage()),
                        );
                      }),
                      _buildFeatureCard(Icons.pregnant_woman, "Pregnancy Tracker", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PregnancyProgressPage()),
                        );
                      }),
                      _buildFeatureCard(Icons.edit, "Log Current Data", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogDataPage()),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      // Fixed Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF8B5E83),
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _bottomNavItem(Icons.warning, "SOS", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SOSPage()));
              }),
              _bottomNavItem(Icons.bar_chart, "View Risks", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RisksPage()));
              }),
              _bottomNavItem(Icons.explore, "Discover", () {
                // Navigate to DiscoverPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiscoverPage()),
                );
                }),

            ],
          ),
        ),
      ),
    );
  }

  // Feature Buttons with Navigation
  Widget _buildFeatureCard(IconData icon, String text, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          minimumSize: Size(double.infinity, 50),
        ),
        onPressed: onTap,
        icon: Icon(icon, color: Colors.black),
        label: Text(text),
      ),
    );
  }

  // Bottom Navigation Icons with Navigation
  Widget _bottomNavItem(IconData icon, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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