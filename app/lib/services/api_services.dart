import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/models/till_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<TillModel?> getOrders() async {
    TillModel? result;
    try {
      final response = await http
          .get(
            Uri.parse(
                "https://raw.githubusercontent.com/popina/test-flutter/main/data.json"),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = TillModel.fromMap(item);
      } else {
        throw Exception('Error getting data');
      }
    } on SocketException {
      throw Exception('No internet connection');
    } on TimeoutException catch (e) {
      throw Exception('Connection timeout');
    } on Error catch (e) {
      throw Exception('Error getting data');
    }
    return result;
  }
}
