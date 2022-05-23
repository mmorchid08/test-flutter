import 'package:app/models/order_iterm_model.dart';
import 'package:app/models/order_model.dart';
import 'package:app/view_models/order_view_model.dart';
import 'package:app/views/widgets/app_bar_details.dart';
import 'package:app/views/widgets/order_details_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsOrderScreen extends StatelessWidget {
  int index;
  DetailsOrderScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderModel orderDetail =
        Provider.of<OrderViewModel>(context).tillModel!.orders[index];
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              kToolbarHeight + 40,
            ),
            child: AppBarDetails(index: index),
          ),
          body: TabBarView(children: [
            const Center(
              child: Icon(Icons.home),
            ),
            Center(
              child: ListView.builder(
                  itemCount: orderDetail.items.length,
                  itemBuilder: (context, index) {
                    return OrderDetailsCardWidget(
                        orderDetail: orderDetail.items[index]);
                  }),
            ),
          ]),
        ));
  }
}
