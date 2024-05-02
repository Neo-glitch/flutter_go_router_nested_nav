import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Settings Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
              child: Icon(
            Icons.settings,
            size: 100,
            color: Colors.green,
          )),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed("settings_details");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "Go To Settings Details Screen",
            ),
          )
        ],
      ),
    );
  }
}
