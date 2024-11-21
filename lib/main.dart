import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart'; // Ensure you have generated Firebase options
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Authentication Test'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: signIn,
            child: Text('Sign In Anonymously'),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    try{
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("User signed in: ${userCredential.user!.uid}");
    } catch (e) {
      print("Error signing in: $e");
    }
  }
}
