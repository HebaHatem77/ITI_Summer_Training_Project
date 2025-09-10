import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 239, 236),
        title: const Text("About App"),
        centerTitle: true,
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
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "About This App",
                style: TextStyle(
                  fontSize: 35,
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
              Text(
                "     This app was created to help users explore products by categories.\n\n     And get detailed information about each product in an easy and clean way.\n\n     It uses the DummyJSON API as a data source.",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
              ),
              Text(
                "Version: 1.0.0",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
