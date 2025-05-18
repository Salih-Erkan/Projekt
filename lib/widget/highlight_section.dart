import 'package:flutter/material.dart';
import 'package:stammlokal/all_highligts_screen.dart';
import 'package:stammlokal/widget/food_scroll_card.dart';

class HighlightSection extends StatelessWidget {
  const HighlightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        const SizedBox(height: 12),
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
    );
  }
}
