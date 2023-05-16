import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage("images/i.jpg"),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
          padding: const EdgeInsets.only(
            left: 100,
          ),
          child: Row(
            children: [
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'Horizon',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Movieon'),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
