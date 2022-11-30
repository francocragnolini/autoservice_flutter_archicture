import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Function action;
  final double width;
  final double heigth;
  final double fontSize;

  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.action,
    this.width = 200,
    this.heigth = 50,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        action();
      },
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      minWidth: width,
      height: heigth,
      color: color,
      textColor: textColor,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
