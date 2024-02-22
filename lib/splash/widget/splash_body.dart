import 'package:flutter/material.dart';
import 'package:movies_app/splash/widget/custom_skip_btn.dart';
import 'package:movies_app/splash/widget/page_view_body.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            children: const [
              PageViewBody(
                image: 'asset/images/25340.jpg',
              ),
            ],
          ),
          const CustomSkipButton(),
        ],
      ),
    );
  }
}
