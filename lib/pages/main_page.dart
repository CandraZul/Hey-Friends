import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 71),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 58, 58, 71),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Color.fromARGB(255, 250, 154, 104), // Navigation bar
          statusBarColor: Color.fromARGB(255, 58, 58, 71),
        )
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 58, 58, 71),
        buttonBackgroundColor: Color.fromARGB(255, 250, 154, 104),
        color: Color.fromARGB(255, 250, 154, 104),
        height: 55.0,
        items: const<Widget>[
          Icon(Icons.home, size: 30,),
          Icon(Icons.leaderboard, size: 30),
          Icon(Icons.settings, size: 30)
        ]
      ),
    );
  }
}