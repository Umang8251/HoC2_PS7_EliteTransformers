import 'package:flutter/material.dart';
import 'HomePage.dart'; // Import the HomePage file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Set LoginPage as the initial page
    );
  }
}

// LoginPage widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoginSuccessful = false;

  // Simple validation check for login
  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // You can replace this with real authentication logic
    if (username == 'admin' && password == 'password') {
      setState(() {
        _isLoginSuccessful = true;
      });
      // Navigate to HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Show error message if login fails
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Invalid username or password')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
