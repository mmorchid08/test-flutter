import 'package:app/core/const/calculations_function.dart';
import 'package:flutter/material.dart';

import '../../models/order_iterm_model.dart';

class OrderDetailsCardWidget extends StatelessWidget {
  OrderItermModel orderDetail;
  OrderDetailsCardWidget({Key? key, required this.orderDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: size.width / 8,
              height: size.height / 19,
              decoration: BoxDecoration(color: Color(convertStringHexToColor(orderDetail.color))),
              child: const Center(
                child: Text(
                  "1",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                      child: Text(
                        orderDetail.name,
                        style: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                          color: Color(convertStringHexToColor(orderDetail.color)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          converPrice(orderDetail.price, orderDetail.currency),
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300,
                            color:Color(convertStringHexToColor(orderDetail.color)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
