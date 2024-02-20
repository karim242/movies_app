import 'package:flutter/material.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/utiles/app_string.dart';
import 'package:movies_app/movies/presentation/views/6.2%20movies_screen.dart';

void main() async {
  ServeivesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
