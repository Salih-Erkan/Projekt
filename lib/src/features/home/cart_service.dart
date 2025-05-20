class CartItem {
  final String title;
  final String size;
  final int quantity;
  final double totalPrice;

  CartItem({
    required this.title,
    required this.size,
    required this.quantity,
    required this.totalPrice,
  });
}

class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(CartItem item) {
    _items.add(item);
  }

  void clear() => _items.clear();
}
