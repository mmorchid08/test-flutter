import 'package:app/models/till_model.dart';
import 'package:app/view_models/order_view_model.dart';
import 'package:app/views/widgets/app_bar_home.dart';
import 'package:app/views/widgets/order_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeOrdersScreen extends StatelessWidget {
  const HomeOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderViewModel orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    orderViewModel.getApiData();
    return Consumer(
      builder: (context, OrderViewModel orderViewModel, _) {
        TillModel? tillModel = orderViewModel.tillModel;
        if (orderViewModel.orderStatus == OrderStatus.LOADING) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
        } else if (orderViewModel.orderStatus == OrderStatus.SUCCESS) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                kToolbarHeight,
              ),
              child: AppBarHome(
                titleText: "${tillModel!.orders.length.toString()} commandes",
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                  itemCount: tillModel.orders.length,
                  itemBuilder: (context, index) {
                    return (OrderCardWidget(index:index));
                  }),
            ),
          );
      } else {
        // Failure
        return Scaffold(
          body: Center(
            child: Text(orderViewModel.errorMessage.toString()
           )
          ),
        );
      }
      }
    );
  }
}
