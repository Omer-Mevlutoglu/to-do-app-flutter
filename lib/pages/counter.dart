// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

class MyCounter extends StatelessWidget {
  const MyCounter(
      {super.key, required this.allcompleted, required this.alltodos});
  final int allcompleted;
  final int alltodos;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27.0),
      child: Text(
        "$allcompleted/$alltodos",
        style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.bold,
          color: allcompleted==alltodos?Colors.green:Colors.red,
        ),
      ),
    );
  }
}
