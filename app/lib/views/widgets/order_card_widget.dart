import 'package:app/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderCardWidget extends StatelessWidget {
  OrderModel ordreDetail;
  OrderCardWidget({Key? key, required this.ordreDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        color: Colors.white,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width / 4,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.redAccent),
              child: Center(
                child: Text(
                  ordreDetail.table,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
