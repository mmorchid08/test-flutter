import 'package:app/core/const/calculations_function.dart';
import 'package:app/core/theme/theme_model.dart';
import 'package:app/models/order_model.dart';
import 'package:app/view_models/order_view_model.dart';
import 'package:app/views/widgets/tab_bar_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarDetails extends StatelessWidget {
  int index;
  AppBarDetails({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderModel orderDetail =
        Provider.of<OrderViewModel>(context).tillModel!.orders[index];
    return Stack(
      children: [
        ChangeNotifierProvider(
          create: (context) => TabTheme(Colors.blue, Colors.grey[500]),
          child: Consumer(builder: (context, TabTheme tabTheme, _) {
            return AppBar(
              leading: BackButton(color: Colors.grey[500]),
              backgroundColor: Colors.white,
              bottom: TabBar(
                onTap: (index) {
                index == 0 ?
                  tabTheme.setTabColor(Colors.blue, Colors.grey[500]) :
                  tabTheme.setTabColor(Colors.grey[500], Colors.blue);
                },
                tabs: [
                  Tab(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TabBarDetailsScreen(
                      numberProduct: orderDetail.items.length,
                      totalPrice: [],
                    ),
                  )),
                  Tab(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TabBarDetailsScreen(
                      totalPrice: TotalPrice(orderDetail),
                      numberProduct: 0,
                    ),
                  )),
                  // Tab(),
                ],
              ),
              title: Text(
                "table " + orderDetail.table,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[700],
                ),
              ),
            );
          }),
        ),
        Positioned(
          top: 95,
          left: 193,
          child: Container(
            width: 2,
            height: 35,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
