import 'package:flutter/material.dart';

class TabTheme with ChangeNotifier {
  Color? priceColor;
  Color? productColor;
  
  TabTheme(this.priceColor, this.productColor);
  setTabColor(Color? c1, Color? c2) {
    priceColor = c1;
    productColor = c2;
    notifyListeners();
  }

}
