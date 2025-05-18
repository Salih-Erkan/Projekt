import 'package:flutter/material.dart';
import 'package:stammlokal/all_highligts_screen.dart';
import 'package:stammlokal/widget/food_scroll_card.dart';
import 'package:stammlokal/widget/info_card.dart';

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          // 🔝 Stack mit gewölbtem Header + Logo über Wölbung
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipPath(
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
              ),

              // 🧀 Logo genau auf der Wölbung platzieren
              Positioned(
                bottom: -20, // überlappt die Wölbung
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/images/logo.png', // 🔁 dein Logo-Bild
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 45), // Platz nach dem Logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 100,
              // width: 350,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // Linker Textbereich ohne Expanded
                  Container(
                    width: 230, // feste Breite statt Expanded
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

                  // Rechter Bildbereich
                  ClipRRect(
                    child: Image.asset(
                      'assets/images/promo_image.png', // Pfad anpassen
                      width: screenWidth * 0.25,
                      height: screenWidth * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),

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

          // Titelzeile mit Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Alle Highlights",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllItemsScreen(),
                      ),
                    );
                  },
                  child: const Text("Alle ansehen"),
                ),
              ],
            ),
          ),

          // Horizontale Scroll-Liste
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                FoodScrollCard(
                  title: 'Pizza Margherita',
                  price: '4,50 €',
                  imagePath: 'assets/images/vegetarische_pizza.png',
                ),
                SizedBox(width: 12),
                FoodScrollCard(
                  title: 'Pizza Sucuk',
                  price: '5,50 €',
                  imagePath: 'assets/images/vegetarische_pizza.png',
                ),
                SizedBox(width: 12),
                FoodScrollCard(
                  title: 'Pizza Salami',
                  price: '5,50 €',
                  imagePath: 'assets/images/vegetarische_pizza.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 🎯 CustomClipper für nach innen gewölbte Unterkante
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
