import 'package:app/core/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class TabBarDetailsScreen extends StatelessWidget {
  List<String> totalPrice;
  int numberProduct;

  TabBarDetailsScreen({
    Key? key,
    required this.numberProduct,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TabTheme _tabTheme =
        Provider.of<TabTheme>(context, listen: false);
    if (numberProduct == 0 && totalPrice.isNotEmpty) {
      return Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              totalPrice[0],
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: _tabTheme.productColor,
              ),
            ),
            Text(
              ",${totalPrice[1]} €",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w200,
                color: _tabTheme.productColor,
              ),
            ),
          ],
        ),
      );
    } else if (numberProduct >= 0 && totalPrice.isEmpty) {
      return Text(
        "${numberProduct.toString()} produits",
        style: TextStyle(
          fontSize: 25.0,
          color: _tabTheme.priceColor,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return Container();
  }
}
