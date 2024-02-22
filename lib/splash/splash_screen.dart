
import 'package:flutter/material.dart';
import 'package:movies_app/splash/widget/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenBody(),
    );
  }
}