import 'package:flutter/material.dart';
import 'package:stammlokal/widget/food_scroll_card.dart';

class AllItemsScreen extends StatefulWidget {
  const AllItemsScreen({super.key});

  @override
  State<AllItemsScreen> createState() => _AllItemsScreenState();
}

class _AllItemsScreenState extends State<AllItemsScreen> {
  final List<Map<String, String>> allItems = [
    {
      'title': 'Pizza Margherita',
      'price': '4,50 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Sucuk',
      'price': '5,50 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Thunfisch',
      'price': '5,50 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Pan Spezi',
      'price': '7,30 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Chicken Wings',
      'price': '5,00 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Salami',
      'price': '5,50 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Hawaii',
      'price': '6,20 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Funghi',
      'price': '5,80 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza BBQ Chicken',
      'price': '7,50 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza 4 Käse',
      'price': '6,90 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Diavolo',
      'price': '6,70 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Rucola',
      'price': '6,30 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Spinaci',
      'price': '6,00 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Tonno Cipolla',
      'price': '6,80 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Calzone',
      'price': '6,90 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
    {
      'title': 'Pizza Veggie Deluxe',
      'price': '7,10 €',
      'imagePath': 'assets/images/vegetarische_pizza.png',
    },
  ];

  List<Map<String, String>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems; // Anfangs alle anzeigen
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems =
          allItems
              .where(
                (item) =>
                    item['title']!.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alle Highlights")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // 🔍 Suchfeld
            TextField(
              onChanged: _filterItems,
              decoration: InputDecoration(
                hintText: "Suche nach einem Gericht...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Grid
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    itemCount: filteredItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.93,
                        ),
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return SizedBox(
                        child: FoodScrollCard(
                          title: item['title']!,
                          price: item['price']!,
                          imagePath: item['imagePath']!,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
