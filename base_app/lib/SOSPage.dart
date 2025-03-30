import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SOSPage extends StatelessWidget {
  final String emergencyNumber = "108"; // Replace with actual emergency number
  final String emergencyContact = "9876543210"; // Replace with actual saved contact

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency SOS"),
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 34, 5, 55),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _sosButton("Call Ambulance", Icons.local_hospital, const Color.fromARGB(255, 211, 29, 29), () {
              _callEmergencyNumber(emergencyNumber);
            }),
            SizedBox(height: 20),
            _sosButton("Alert Emergency Contact", Icons.phone, const Color.fromARGB(255, 154, 144, 144), () {
              _callEmergencyNumber(emergencyContact);
            }),
            SizedBox(height: 20),
            _sosButton("Find Nearby Hospitals", Icons.location_on, const Color.fromARGB(255, 157, 147, 147), () {
              _openGoogleMaps(12.9716, 77.5946); // Replace with real-time GPS coordinates
            }),
          ],
        ),
      ),
    );
  }

  // Reusable SOS Button Widget
  Widget _sosButton(String text, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: const Color.fromARGB(255, 66, 29, 114),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: TextStyle(fontSize: 18)),
    );
  }

  // Function to Call Emergency Number
  Future<void> _callEmergencyNumber(String number) async {
    final Uri phoneUri = Uri.parse("tel:$number");
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      Fluttertoast.showToast(
        msg: "Cannot make a call",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  // Function to Open Google Maps with Nearby Government Hospitals
  Future<void> _openGoogleMaps(double latitude, double longitude) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/government+hospital/@$latitude,$longitude,15z';
    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl), mode: LaunchMode.externalApplication);
    } else {
      Fluttertoast.showToast(
        msg: "Cannot open Google Maps",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
}
