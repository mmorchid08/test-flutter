import 'package:app/models/till_model.dart';
import 'package:app/services/api_services.dart';
import 'package:flutter/material.dart';

enum OrderStatus { SUCCESS, FAILURE, LODING }

class OrderViewModel with ChangeNotifier {
  OrderStatus orderStatus = OrderStatus.LODING;
  TillModel? tillModel;
  String? errorMessage;

  void getApiData() async {
    orderStatus = OrderStatus.LODING;
    errorMessage = null;
    try {
      tillModel = await ApiServices.getOrders();
      if (tillModel == null) {
        orderStatus = OrderStatus.FAILURE;
        errorMessage = "No Data";
      }
      orderStatus = OrderStatus.SUCCESS;
    } catch (e) {
      orderStatus = OrderStatus.FAILURE;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
