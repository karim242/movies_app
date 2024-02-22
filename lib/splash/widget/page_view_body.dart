import 'package:flutter/material.dart';

class PageViewBody extends StatelessWidget {
  const PageViewBody({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(image,
              height: MediaQuery.sizeOf(context).height, fit: BoxFit.fill),
        ),
      ],
    );
  }
}
