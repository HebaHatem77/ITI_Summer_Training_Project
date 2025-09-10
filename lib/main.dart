import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:iti_project/firebase/register_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Introduction {
  final String imageUrl;
  final String title;
  final String subTitle;

  Introduction({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

//Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Onboarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 241, 219, 209),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 241, 219, 209),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 241, 219, 209),
            ],
            center: Alignment.center,
            radius: .5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.gifts,
                color: const Color.fromARGB(255, 158, 123, 115),
                size: 36,
                shadows: [
                  Shadow(
                    offset: const Offset(2, 2),
                    blurRadius: 15,
                    color: Color.fromARGB(255, 241, 219, 209),
                  ),
                ],
              ),
              Text(
                "Unique Mall",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "cursive",
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 158, 123, 115),
                  shadows: [
                    Shadow(
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                      color: const Color.fromARGB(152, 158, 123, 115),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Onboarding
class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Introduction> list = [
    Introduction(
      title: 'Furniture',
      subTitle: '"Elegance that defines your home"',
      imageUrl: 'imgs/f1.jpeg',
    ),
    Introduction(
      title: 'Fragrances',
      subTitle: '"A fragrances that lingers in memory"',
      imageUrl: 'imgs/p4.jpeg',
    ),
    Introduction(
      title: 'Groceries',
      subTitle: '"Flavors crafted to delight"',
      imageUrl: 'imgs/g2.jpeg',
    ),
    Introduction(
      title: 'Beauty',
      subTitle: '"Radiance that speaks for you"',
      imageUrl: 'imgs/b2.jpeg',
    ),
  ];

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// الخلفية تتغير حسب الصفحة الحالية
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey(list[_currentIndex].imageUrl),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(list[_currentIndex].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /// المحتوى مع PageView
          PageView.builder(
            controller: _controller,
            itemCount: list.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (context, index) {
              final intro = list[index];
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      intro.title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(255, 75, 32, 16),
                            offset: Offset(2, 2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      intro.subTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Color.fromARGB(255, 76, 34, 18),
                            offset: Offset(2, 2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),

          /// أزرار التحكم أسفل الشاشة
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// زر Skip يظهر إلا في آخر صفحة
                if (_currentIndex < list.length - 1)
                  TextButton(
                    onPressed: goToLogin,
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                else
                  const SizedBox(width: 60), // فراغ عشان يبقى متوازن مع زر Next
                /// مؤشر الصفحات (Dots)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    list.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentIndex == index ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? Colors.white
                            : Colors.white54,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                /// زر Next أو Get Started
                TextButton(
                  onPressed: () {
                    if (_currentIndex == list.length - 1) {
                      goToLogin();
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _currentIndex == list.length - 1 ? "Get Started" : "Next",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
