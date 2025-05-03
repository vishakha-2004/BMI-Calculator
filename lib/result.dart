import 'package:BMI/BottomButton.dart';
import 'package:BMI/InputPage.dart';
import 'package:flutter/material.dart';

import 'block.dart';

class result extends StatelessWidget {

  result({required this.bmiResult, required this.resultText, required this.interpretation});
   final String bmiResult;
   final String resultText;
   final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                  child: Text('Your Result', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.pink.shade200),))
          ),
          Expanded(
            flex: 4,
              child: block(
                CardColor: selectedBlockColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(bmiResult.toUpperCase(),style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.white),),
                    Text(resultText.toUpperCase(),style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.pink.shade50),),
                    Text(interpretation, style: TextStyle(fontSize: 23, color: Colors.white),)
                  ],
                ),
              )
          ),
          Expanded(
              child: Text('data')
          ),
          BottomButton(OnTap: (){
            Navigator.pop(context);
            },
              title: 'RE-CALCULATE'
          )
        ],
      ),
    );
  }
}
