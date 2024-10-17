import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  NumberButton({
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFF33CCCC),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          shape: CircleBorder(),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
