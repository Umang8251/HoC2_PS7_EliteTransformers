import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LogDataPage extends StatefulWidget {
  @override
  _LogDataPageState createState() => _LogDataPageState();
}

class _LogDataPageState extends State<LogDataPage> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _systolicBpController = TextEditingController();
  final TextEditingController _diastolicBpController = TextEditingController();
  final TextEditingController _bloodSugarController = TextEditingController();
  final TextEditingController _bodyTempController = TextEditingController();
  final TextEditingController _bmiController = TextEditingController();
  final TextEditingController _previousConditionsController =
      TextEditingController();
  final TextEditingController _preexistingConditionsController =
      TextEditingController();
  final TextEditingController _gestationalAgeController =
      TextEditingController();
  final TextEditingController _mentalHealthController = TextEditingController();
  final TextEditingController _heartRateController = TextEditingController();

  String _riskPrediction = "Risk Level will appear here";

  // Function to send data to Flask API
  Future<void> _predictRisk() async {
    const String apiUrl =
        "http://127.0.0.1:5000/predict"; // Change this to your Flask server IP

    final Map<String, dynamic> requestData = {
      "Age": int.tryParse(_ageController.text) ?? 0,
      "Systolic BP": int.tryParse(_systolicBpController.text) ?? 0,
      "Diastolic BP": int.tryParse(_diastolicBpController.text) ?? 0,
      "BS": double.tryParse(_bloodSugarController.text) ?? 0.0,
      "Body Temperature": double.tryParse(_bodyTempController.text) ?? 0.0,
      "BMI": double.tryParse(_bmiController.text) ?? 0.0,
      "Previous Complications":
          int.tryParse(_previousConditionsController.text) ?? 0,
      "Preexisting Diabetes":
          int.tryParse(_preexistingConditionsController.text) ?? 0,
      "Gestational Diabetes": int.tryParse(_gestationalAgeController.text) ?? 0,
      "Mental Health": int.tryParse(_mentalHealthController.text) ?? 0,
      "Heart Rate": int.tryParse(_heartRateController.text) ?? 0,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          _riskPrediction =
              "Predicted Risk Level: ${responseData['risk_level']}";
        });
      } else {
        setState(() {
          _riskPrediction = "Error: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _riskPrediction = "Failed to connect to server!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log Health Data & Predict Risk")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(_ageController, 'Age'),
              _buildTextField(_systolicBpController, 'Systolic BP'),
              _buildTextField(_diastolicBpController, 'Diastolic BP'),
              _buildTextField(_bloodSugarController, 'Blood Sugar'),
              _buildTextField(_bodyTempController, 'Body Temperature'),
              _buildTextField(_bmiController, 'BMI'),
              _buildTextField(
                _previousConditionsController,
                'Previous Complications',
              ),
              _buildTextField(
                _preexistingConditionsController,
                'Preexisting Diabetes',
              ),
              _buildTextField(
                _gestationalAgeController,
                'Gestational Diabetes',
              ),
              _buildTextField(_mentalHealthController, 'Mental Health'),
              _buildTextField(_heartRateController, 'Heart Rate'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _predictRisk,
                child: Text('Predict Risk'),
              ),
              SizedBox(height: 20),
              Text(
                _riskPrediction,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
    );
  }
}
