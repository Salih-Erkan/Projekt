import 'package:flutter/material.dart';
import 'package:stammlokal/cart_service.dart';

class FoodDetailOverlay extends StatefulWidget {
  final String title;
  final String price;
  final String imagePath;

  const FoodDetailOverlay({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  State<FoodDetailOverlay> createState() => _FoodDetailOverlayState();
}

class _FoodDetailOverlayState extends State<FoodDetailOverlay> {
  int quantity = 1;
  int selectedSizeIndex = 0;

  final List<Map<String, dynamic>> sizes = [
    {'label': 'ca. Ø 17 cm', 'price': 0.0},
    {'label': 'ca. Ø 22 cm', 'price': 3.20},
    {'label': 'ca. Ø 30 cm', 'price': 7.80},
  ];

  @override
  Widget build(BuildContext context) {
    final basePrice = double.parse(
      widget.price.replaceAll(',', '.').replaceAll('€', ''),
    );
    final extra = sizes[selectedSizeIndex]['price'] as double;
    final total = ((basePrice + extra) * quantity);

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(24),
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.imagePath,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share_outlined),
                        tooltip: 'Teilen',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Teilen-Funktion folgt'),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.info_outline),
                        tooltip: 'Produktinfo',
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder:
                                (_) => AlertDialog(
                                  title: const Text("Zutaten & Infos"),
                                  content: const Text(
                                    "Diese Pizza enthält: Hähnchen, Jalapeños, Brokkoli und Sauce hollandaise.\n\nKann Spuren von Gluten, Milch und Ei enthalten.",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Schließen"),
                                    ),
                                  ],
                                ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        tooltip: 'Schließen',
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                widget.price,
                style: const TextStyle(fontSize: 18, color: Colors.blue),
              ),
              const SizedBox(height: 8),
              const Text(
                'mit Hähnchen, Jalapeños, Brokkoli und Sauce hollandaise',
              ),
              const SizedBox(height: 24),
              const Text(
                'Deine Größe',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              for (int i = 0; i < sizes.length; i++)
                RadioListTile<int>(
                  title: Text(
                    sizes[i]['label'],
                    style: const TextStyle(fontSize: 14),
                  ),
                  subtitle:
                      (sizes[i]['price'] as double) > 0
                          ? Text(
                            '+ ${(sizes[i]['price'] as double).toStringAsFixed(2)} €',
                          )
                          : null,
                  value: i,
                  groupValue: selectedSizeIndex,
                  onChanged: (val) {
                    setState(() => selectedSizeIndex = val!);
                  },
                ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() => quantity--);
                            }
                          },
                        ),
                        Text(
                          quantity.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() => quantity++);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        //padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        final selectedSize =
                            sizes[selectedSizeIndex]['label'] as String;
                        final cartItem = CartItem(
                          title: widget.title,
                          size: selectedSize,
                          quantity: quantity,
                          totalPrice: total,
                        );

                        CartService().addItem(cartItem);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${widget.title} wurde zum Warenkorb hinzugefügt',
                            ),
                          ),
                        );

                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Zur Bestellung hinzufügen  ${total.toStringAsFixed(2)} €',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
