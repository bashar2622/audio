import 'package:flutter/material.dart';
import '../functions.dart';

class CustomHeight extends StatelessWidget {
  const CustomHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Functions.getScreenHeight(context)/20,
    );
  }
}