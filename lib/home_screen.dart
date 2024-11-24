import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve userId from route arguments
    final userId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        automaticallyImplyLeading: false, // Prevent back navigation
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Home Screen!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Unique ID:',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              userId,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to Chat Screen (to be implemented later)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Chat feature coming soon!')),
                );
              },
              child: const Text('Go to Chat'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Log out and redirect to AuthScreen
                Navigator.pushReplacementNamed(context, '/auth');
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
