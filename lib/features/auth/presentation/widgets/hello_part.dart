import 'package:flutter/material.dart';
import 'package:audio_app/core/themes.dart';

class HelloPart extends StatelessWidget {
  const HelloPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Welcome To Audio managment App',style: themes.textTheme.titleLarge,);
  }
  
}