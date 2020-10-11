import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton(
      {this.child, this.color, this.borderRadius:8.0, this.onPressed, this
          .height:50.0});
  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: color,
        disabledColor: color,
        onPressed: onPressed,
      ),
    );
  }
}
