import 'package:flutter/material.dart';

class InfoTable extends StatelessWidget {
  const InfoTable({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 230,
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'UP TO 40% OFF ON FIRST ORDER UP TO 40% OFF ON FIRST',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              child: Image.asset(
                'assets/images/promo_image.png',
                width: screenWidth * 0.25,
                height: screenWidth * 0.25,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
