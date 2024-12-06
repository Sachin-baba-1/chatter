import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Safely retrieve userId from route arguments
    final userId = ModalRoute.of(context)?.settings.arguments as String? ?? 'Guest';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        automaticallyImplyLeading: false, // Prevent back navigation
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Home Screen!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Unique ID:',
              style: TextStyle(fontSize: 18),
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
                Navigator.pushNamed(
                  context,
                  '/chat',
                  arguments: userId, // Pass userId to chat screen if needed
                );
              },
              child: const Text('Go to Chat'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Log out and redirect to AuthScreen
                await FirebaseAuth.instance.signOut();
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
