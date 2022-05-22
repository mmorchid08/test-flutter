import 'package:app/services/api_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void toto()async{
    await ApiServices().getOrders();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     toto();


  }
  @override
  Widget build(BuildContext context) {
    //  toto();
    return const Scaffold(backgroundColor: Colors.amber,);

  }
}
