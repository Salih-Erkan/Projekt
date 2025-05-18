import 'package:flutter/material.dart';
import 'package:stammlokal/main.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomConcaveClipper(),
      child: Container(
        height: 280,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/header_image.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
