import 'dart:math';

import 'package:flutter/material.dart';

import 'package:autoservice_app/themes/autoservice_theme.dart';

class FallBackBox extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  const FallBackBox(
      {super.key,
      required this.title,
      required this.description,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 50,
        // color: AutoserviceTheme.light().backgroundColor,
        color: Colors.red,
        margin: EdgeInsets.all(50),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AutoserviceTheme.lightTextTheme.headline1,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: AutoserviceTheme.lightTextTheme.headline6,
              ),
              Icon(
                icon,
                size: 50,
              ),
            ]),
      ),
    );
  }
}
