import 'package:app/core/const/calculations_function.dart';
import 'package:app/models/order_model.dart';
import 'package:app/view_models/order_view_model.dart';
import 'package:app/views/screens/details_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderCardWidget extends StatefulWidget {
  int index;
  OrderCardWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<OrderCardWidget> createState() => _OrderCardWidgetState();
}

class _OrderCardWidgetState extends State<OrderCardWidget> {
  List<String> converPrice = [];

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    OrderModel order =
        Provider.of<OrderViewModel>(context).tillModel!.orders[widget.index];
    converPrice = TotalPrice(order);

    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailsOrderScreen(index: widget.index))),
      child: Container(
        color: Colors.white,
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  order.table,
                  style:const  TextStyle(
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
                                order.guests.toString(),
                                // widget.ordre.guests.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                          Text(
                            order.date.isEmpty ? "18:20" : order.date,
                            // widget.ordre.date.isEmpty
                            //     ? "18:20"
                            //     : widget.ordre.date,
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
                          converPrice[0],
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          "," + converPrice[1] + order.items[0].currency,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey[500],
                          ),
                        ),
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
