import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text('My First App'),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
    ),
    body: const Center(
      child: Text(
        "Hello homies!",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: Colors.blueGrey,
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        // This function is required, even if it's empty for now.
        // You can add logic here for when the button is pressed.
      },
      backgroundColor: Colors.blueGrey,
      child: const Text("+"),
    ),
  ),
));
