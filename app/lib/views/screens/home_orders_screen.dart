import 'package:app/models/till_model.dart';
import 'package:app/view_models/order_view_model.dart';
import 'package:app/views/widgets/app_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeOrdersScreen extends StatelessWidget {
  const HomeOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<OrderViewModel>(context, listen: false).getApiData();
    TillModel tillModel = Provider.of<OrderViewModel>(context).tillModel!;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          kToolbarHeight,
        ),
        child: AppBarHome(
          titleText: tillModel.orders.length.toString() + " commandes",
        ),
      ),
    );
  }
}
