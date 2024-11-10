import 'package:flutter/material.dart';
import 'package:audio_app/core/themes.dart';

class InfoPart extends StatelessWidget {
  const InfoPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('this app helps you to manage your audio',
                style: themes.textTheme.titleSmall,softWrap: true,textAlign: TextAlign.center,maxLines: 3);
  }
}

