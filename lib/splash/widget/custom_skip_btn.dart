import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/views/6.2%20movies_screen.dart';

class CustomSkipButton extends StatelessWidget {
  const CustomSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const MainMoviesScreen();
                }));
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
