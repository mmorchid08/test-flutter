import 'package:app/models/order_iterm_model.dart';

class OrderModel {
  final String object;
  final int id;
  final String table;
  final int guests;
  final String data;
  final List<OrderItermModel> iterms;

  OrderModel({
    required this.object,
    required this.id,
    required this.table,
    required this.guests,
    required this.data,
    required this.iterms,
  });

  factory OrderModel.fromMap(Map<String, dynamic> json) {
    return OrderModel(
      object: json["object"],
      id: json["id"],
      table: json["table"],
      guests: json["guests"],
      data: json["data"],
      iterms: json["iterms"]
          .map((iterm) => OrderItermModel.fromMap(iterm))
          .toList(),
    );

    // iterms =
  }
}
