import 'package:app/models/order_model.dart';

class TillModel {
  final String object;
  final List<OrderModel> orders;

  TillModel({
    required this.object,
    required this.orders,
  });

  factory TillModel.fromMap(Map<String, dynamic> json) {
    return TillModel(
      object: json["object"],
      orders: json["orders"].map<OrderModel>((item)  {
        return OrderModel.fromMap(item);
        }).toList(),
    );
  }
}
