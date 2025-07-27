
import 'package:flutter/material.dart';

final class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          "assets/images/splash_screen.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}





