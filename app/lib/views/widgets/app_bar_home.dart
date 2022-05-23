import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  String titleText;

  AppBarHome({Key? key, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
        elevation: 0,
        title:  Center(
          child: Text(
            titleText,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey[700],
            ),
          ),
        ),
    );
  }
}