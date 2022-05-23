import 'package:app/models/order_iterm_model.dart';
import 'package:app/models/order_model.dart';

List<String> TotalPrice(OrderModel? ordre) {
  int totalPrice = 0;
  String totalPriceStr;
  List<String> converPrice = [];

  if (ordre?.items != null){
    for (var i = 0; i < ordre!.items.length; i++) {
      totalPrice += ordre.items[i].price;
    }
  }
  totalPriceStr = totalPrice.toString();
  converPrice.insert(0, totalPriceStr.substring(0, totalPriceStr.length - 2));
  converPrice.insert(1,
      totalPriceStr.substring(totalPriceStr.length - 2, totalPriceStr.length));

  return converPrice;
}

String converPrice(int  price, String currency) {
  String totalPriceStr;
  String converPrice ="";

  
  totalPriceStr = price.toString();
  converPrice = totalPriceStr.substring(0, totalPriceStr.length - 2);
  converPrice = converPrice + ","+ totalPriceStr.substring(totalPriceStr.length - 2, totalPriceStr.length) + currency ;

  return converPrice;
}


  int convertStringHexToColor(String color) {
    var hexColor = color.replaceAll("#", "");
    return int.parse("0xff" + hexColor);
  }


// int countmeals(List<OrderItermModel>items){
//   int i = 0;
//   List<String> elment = [];
//   Map<String, int> map = {}; 
//   for (var i = 0; i < items.length;i++){
//     elment.insert(i, items[i].name);
//   }

//   while(i < elment.length){
//    if (map.isEmpty){
//      map['name'] = 
//    }
//     i++;
//   }
  
//   int counter;


// }