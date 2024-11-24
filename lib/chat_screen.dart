import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Page')),
      body: Center(
        child: Text(
          'This is the Chat Page!',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
