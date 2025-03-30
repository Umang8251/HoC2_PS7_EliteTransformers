import 'package:flutter/material.dart';

class ToolsServicesPage extends StatelessWidget {
  const ToolsServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tools and Services"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildPlacard(
                "Online Consultation",
                "Access consultations with medical professionals.",
                Colors.blue.shade700,
                context,
                () {
                  // Navigate to the online consultation page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnlineConsultationPage(),
                    ),
                  );
                },
              ),
              _buildPlacard(
                "Group Discussions",
                "Join health-related discussions with experts and patients.",
                Colors.green.shade700,
                context,
                () {
                  // Navigate to the group discussions page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupDiscussionsPage(),
                    ),
                  );
                },
              ),
              _buildPlacard(
                "Medical Records",
                "View and manage your medical history.",
                Colors.orange.shade700,
                context,
                () {
                  // Navigate to the medical records page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicalRecordsPage(),
                    ),
                  );
                },
              ),
              _buildPlacard(
                "Health Tips",
                "Stay informed with the latest health news.",
                Colors.purple.shade700,
                context,
                () {
                  // Navigate to the health tips page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HealthTipsPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create a uniform placard for tools and services with navigation functionality
  Widget _buildPlacard(
    String title,
    String description,
    Color color,
    BuildContext context,
    VoidCallback onPressed,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(description, style: TextStyle(fontSize: 18, color: color)),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: onPressed, child: const Text("Access")),
        ],
      ),
    );
  }
}

// Example placeholder pages for the tools/services
class OnlineConsultationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Online Consultation"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: const Text("Consult with medical professionals here."),
      ),
    );
  }
}

class GroupDiscussionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Group Discussions"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: const Text("Join discussions with experts and patients."),
      ),
    );
  }
}

class MedicalRecordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical Records"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(child: const Text("Manage and view your medical records.")),
    );
  }
}

class HealthTipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health Tips"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(child: const Text("Read the latest health tips and news.")),
    );
  }
}
