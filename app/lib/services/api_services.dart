import 'dart:convert';

import 'package:app/models/till_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  static Future<TillModel?> getOrders() async {
    TillModel? result;
    try {
      final response = await http.get(
        Uri.parse(
            "https://raw.githubusercontent.com/popina/test-flutter/main/data.json"),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = TillModel.fromMap(item);
      } 
      else {
        print("error");
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
    return result;
  }
}
