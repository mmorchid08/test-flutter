import 'package:app/models/order_model.dart';

class TillModel {
  final String till;
  final List<OrderModel> orders;

  TillModel({
    required this.till,
    required this.orders,
  });

  factory TillModel.fromMap(Map<String, dynamic> json) {
    return TillModel(
      till: json["till"],
      orders: json["orders"].map((iterm) => TillModel.fromMap(iterm)).toList(),
    );
  }
}
