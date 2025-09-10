import 'package:flutter/material.dart';

class AboutTeamPage extends StatelessWidget {
  const AboutTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 248, 239, 236),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        width: double.infinity,
        height: double.infinity,
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
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(height: 100),
            Text(
              "The App Made by:",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              "Heba Hatem",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: "Arial",
                color: Color.fromARGB(255, 151, 119, 102),
                shadows: [
                  Shadow(
                    color: Colors.white,
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
            const Text(
              "My goal is to provide a simple and enjoyable user experience while practicing and improving my Flutter development skills."
              "as part of the ITI training program. "
              "\n\n\nThis project was developed under the supervision of",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            const Text(
              "Eng. Adham El-Nagar",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: "Arial",
                color: Color.fromARGB(255, 151, 119, 102),
                shadows: [
                  Shadow(
                    color: Colors.white,
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
