import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.OnTap, required this.title});

  final  OnTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        height: 50,
        color: Colors.pinkAccent,
        margin: EdgeInsets.only(bottom: 12),
        child: Center(
            child: Text(title, style: TextStyle(color: Colors.white,fontSize: 20),)
        ),
      ),
    );
  }
}