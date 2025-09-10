import 'package:flutter/material.dart';
import 'package:iti_project/about_app_screen.dart';
import 'package:iti_project/about_team_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 241, 219, 209),
          ],
          center: Alignment.center,
          radius: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          Text(
            "Profile",
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              fontFamily: "cursive",
              color: Color.fromARGB(
                255,
                158,
                123,
                115,
              ),
              shadows: [
                Shadow(
                  color: Color.fromARGB(255, 200, 180, 174),
                  offset: Offset(
                    5,
                    5,
                  ),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 251, 154, 131),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutAppPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    "About APP",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: 300,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 251, 154, 131),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutTeamPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    "About Team",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
