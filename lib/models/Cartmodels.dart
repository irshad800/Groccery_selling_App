class Cart {
  String? id;
  String itemName;
  int price;
  int qty;

  Cart({
    this.id,
    required this.itemName,
    required this.price,
    required this.qty,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'price': price,
      'qty': qty,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map, String id) {
    return Cart(
      id: id,
      itemName: map['itemName'] ?? '',
      price: (map['price'] ?? 0).toInt(), //
      qty: map['qty'] ?? 0,
    );
  }
}
