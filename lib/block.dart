import 'package:flutter/cupertino.dart';

class block extends StatelessWidget {
  block({required this.cardChild, this.CardColor, this.onPress});

  final Widget cardChild;
  final CardColor;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          child: cardChild,
          height: 200, width: 150,
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CardColor,
          ),
        ),
      ),
    );
  }
}