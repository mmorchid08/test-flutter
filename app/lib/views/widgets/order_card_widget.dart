import 'package:app/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderCardWidget extends StatefulWidget {
  OrderModel ordreDetail;
  OrderCardWidget({Key? key, required this.ordreDetail}) : super(key: key);

  @override
  State<OrderCardWidget> createState() => _OrderCardWidgetState();
}

class _OrderCardWidgetState extends State<OrderCardWidget> {
  List<String> converPrice = [];

  @override
  void initState() {
    super.initState();
    converPrice = TotalPrice(widget.ordreDetail);
  }

  List<String> TotalPrice(OrderModel ordreDetail) {
    int totalPrice = 0;
    String totalPriceStr;
    List<String> converPrice = [];

    for (var i = 0; i < ordreDetail.items.length; i++) {
      totalPrice += ordreDetail.items[i].price;
    }
    totalPriceStr = totalPrice.toString();
    converPrice.insert(0, totalPriceStr.substring(0, totalPriceStr.length - 2));
    converPrice.insert(
        1,
        totalPriceStr.substring(
            totalPriceStr.length - 2, totalPriceStr.length));

    return converPrice;
  }

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
                  widget.ordreDetail.table,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 7.0, bottom: 10.0, top: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.face_sharp, color: Colors.blueGrey),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.ordreDetail.guests.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                          Text(
                            widget.ordreDetail.date.isEmpty
                                ? "18:20"
                                : widget.ordreDetail.date,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          converPrice[0] + ",",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          converPrice[1],
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          widget.ordreDetail.items[0].currency,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey[800],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
