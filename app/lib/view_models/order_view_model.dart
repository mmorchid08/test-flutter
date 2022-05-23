import 'package:app/models/till_model.dart';
import 'package:app/services/api_services.dart';
import 'package:flutter/material.dart';

enum OrderStatus { SUCCESS, FAILURE, LOADING }

class OrderViewModel with ChangeNotifier {
  OrderStatus orderStatus = OrderStatus.LOADING;
  TillModel? tillModel;
  String? errorMessage;

  void getApiData() async {
    orderStatus = OrderStatus.LOADING;
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
