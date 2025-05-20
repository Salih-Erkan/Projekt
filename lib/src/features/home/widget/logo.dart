import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -20,
      left: 0,
      right: 0,
      child: Center(
        child: PhysicalModel(
          elevation: 8,
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          shadowColor: Colors.black54,
          child: Container(
            width: 130,
            height: 130,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
