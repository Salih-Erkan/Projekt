import 'package:flutter/material.dart';
import 'package:stammlokal/src/features/home/widget/highlight_section.dart';
import 'package:stammlokal/src/features/home/widget/info_card.dart';
import 'package:stammlokal/src/features/home/widget/info_table.dart';
import 'package:stammlokal/src/features/home/widget/logo.dart';
import 'package:stammlokal/src/features/home/widget/main_header.dart';
import 'package:stammlokal/src/features/menu/menu_section.dart';

void main() => runApp(const StammLokalApp());

class StammLokalApp extends StatelessWidget {
  const StammLokalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

final List<Map<String, dynamic>> menuItems = [
  {
    'title': 'Pizza Margherita',
    'subtitle': '',
    'price': '4,50 €',
    'popular': true,
    'image': 'assets/images/vegetarische_pizza.png',
  },
  {
    'title': 'Pizza Salami',
    'subtitle': '',
    'price': '5,50 €',
    'popular': true,
    'image': 'assets/images/vegetarische_pizza.png',
  },
  {
    'title': 'Pizza Schinken',
    'subtitle': '',
    'price': '5,50 €',
    'popular': false,
    'image': 'assets/images/vegetarische_pizza.png',
  },
  {
    'title': 'Pizza Thunfisch',
    'subtitle': '',
    'price': '5,50 €',
    'popular': true,
    'image': 'assets/images/vegetarische_pizza.png',
  },
  {
    'title': 'Pizza Sucuk',
    'subtitle': 'mit türkischer Knoblauchwurst',
    'price': '5,50 €',
    'popular': true,
    'image': 'assets/images/vegetarische_pizza.png',
  },
  {
    'title': 'Pizza Champignons',
    'subtitle': 'mit frischen Champignons',
    'price': '5,10 €',
    'popular': false,
    'image': 'assets/images/vegetarische_pizza.png',
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(clipBehavior: Clip.none, children: [MainHeader(), Logo()]),
            const SizedBox(height: 45),
            InfoTable(screenWidth: screenWidth),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  InfoCard(
                    text: 'Restaurant ist geöffnet',
                    icon: Icons.check_circle_outline,
                    textColor: Colors.green,
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const HighlightSection(),
            const SizedBox(height: 36),
            MenuSection(items: menuItems),
          ],
        ),
      ),
    );
  }
}

class BottomConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 80,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
