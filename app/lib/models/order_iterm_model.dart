class OrderItermModel {
  final String object;
  final int id;
  final String name;
  final int price;
  final String currency;
  final String color;

  OrderItermModel({
    required this.object,
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.color,
  });

  factory OrderItermModel.fromMap(Map<String, dynamic> json) {
    return OrderItermModel(
      object: json["object"],
      id: json["id"],
      name: json["name"],
      price: json["price"],
      currency: json["currency"],
      color: json["color"],
    );
  }
}
