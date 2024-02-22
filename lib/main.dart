import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/utiles/app_string.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import '../splash/splash_screen.dart';

void main() async {
  ServeivesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: MaterialApp(
        title: AppString.appName,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
