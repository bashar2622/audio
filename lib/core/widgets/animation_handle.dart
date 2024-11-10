import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class animationHandle extends StatelessWidget {
  final Widget child;
  const animationHandle({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return ElasticInLeft(
      curve: Curves.linear,
      animate: true,
      child: child,duration: Duration(milliseconds: 500),);
  }
}