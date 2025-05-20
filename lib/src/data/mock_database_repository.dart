import 'package:stammlokal/src/features/home/domain/item.dart';

class MockDatabaseRepository {
  Future<List<Item>> getAllItems() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    ); // simulierte Ladezeit
    return [
      Item(
        title: 'Pizza Margherita',
        price: '4,50 €',
        imagePath: 'assets/images/vegetarische_pizza.png',
      ),
      Item(
        title: 'Pizza Sucuk',
        price: '5,50 €',
        imagePath: 'assets/images/vegetarische_pizza.png',
      ),
      Item(
        title: 'Pizza BBQ Chicken',
        price: '7,50 €',
        imagePath: 'assets/images/vegetarische_pizza.png',
      ),
      // usw.
    ];
  }
}
