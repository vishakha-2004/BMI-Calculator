import 'package:flutter/material.dart';

import 'InputPage.dart';

void main(){
  runApp(BMIcalculator());
}

class BMIcalculator extends StatelessWidget {
  const BMIcalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // textTheme: TextTheme(bodySmall: TextStyle(color: Colors.white) ),
        appBarTheme: AppBarTheme(color: Color(0xFF0A0E21),
                    titleTextStyle: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                    foregroundColor: Colors.white
         ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('BMI Calculator',)),
          ),
          body: InputPage(),
        ),
      ),
    );
  }
}




