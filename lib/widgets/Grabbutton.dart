import 'package:flutter/material.dart';
import 'package:test00001020/widgets/custom_button.dart';

class GrabButton extends CustomRaisedButton {
  final String title;
  final Color color;
  final VoidCallback onPressed;

  GrabButton({
    this.title,
    this.color: Colors.amberAccent,
    this.onPressed,
  }) : super(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            onPressed: onPressed,
            color: color);
}
