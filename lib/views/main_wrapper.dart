import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainWrapperScreen extends StatefulWidget {
  const MainWrapperScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapperScreen> createState() => _MainWrapperScreenState();
}

class _MainWrapperScreenState extends State<MainWrapperScreen> {
  // int selectedIndex = 0;

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          context.pushNamed("player");
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.play_arrow),
      ),
      bottomNavigationBar: SlidingClippedNavBar(
          backgroundColor: Colors.white,
          selectedIndex: widget.navigationShell.currentIndex,
          onButtonPressed: (index) {
            // setState(() {
            //   selectedIndex = index;
            // });
            _goToBranch(index);
          },
          barItems: [
            BarItem(title: "Home", icon: Icons.home),
            BarItem(title: "Settings", icon: Icons.settings),
          ],
          iconSize: 30,
          activeColor: Colors.black),
    );
  }
}
