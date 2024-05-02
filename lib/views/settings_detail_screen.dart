import 'package:flutter/material.dart';

class SettingsDetailScreen extends StatelessWidget {
  const SettingsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Settings Details Screen"),
      ),
    );
  }
}
