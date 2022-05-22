import 'package:app/models/order_iterm_model.dart';

class OrderModel {
  final String object;
  final int id;
  final String table;
  final int guests;
  final String date;
  final List<OrderItermModel> items;

  OrderModel({
    required this.object,
    required this.id,
    required this.table,
    required this.guests,
    required this.date,
    required this.items,
  });

  factory OrderModel.fromMap(Map<String, dynamic> json) {
    return OrderModel(
      object: json["object"],
      id: json["id"],
      table: json["table"],
      guests: json["guests"],
      date: json["date"],
      items: json["items"]
          .map<OrderItermModel>((item) => OrderItermModel.fromMap(item))
          .toList(),
    );

  }
}
