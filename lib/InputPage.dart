import 'package:BMI/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart ';
import 'BottomButton.dart';
import 'block.dart';
import 'iconContent.dart';
import 'calculate.dart';

const selectedBlockColor = Color(0x2CCBCBCB);
const unselectedBlockColor = Color(0xFF111328);

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.male;
  int height=180;
  int weight=50;
  int age =0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            block(
                cardChild: IconContent('Male', FontAwesomeIcons.mars),
                CardColor: gender == Gender.male? selectedBlockColor: unselectedBlockColor,
                onPress: (){
                  setState(() {
                    gender = Gender.male;
                  });
                }
            ),
            block(
                cardChild: IconContent('Female',FontAwesomeIcons.venus),
                CardColor: gender == Gender.female? selectedBlockColor: unselectedBlockColor,
                onPress: (){
                  setState(() {
                    gender = Gender.female;
                  });
                }
            ),
          ],
        ),
        block(
          CardColor: selectedBlockColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('HEIGHT',style: TextStyle(fontSize: 20,color: Colors.white,)),
              Row(
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(height.toString(),style: TextStyle(fontSize: 50,color: Colors.white),),
                  Text('cm',style: TextStyle(fontSize: 20,color: Colors.white),)
                ],
              ),
              SliderTheme(data: SliderTheme.of(context).copyWith(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                activeTrackColor: Colors.pink,
                inactiveTrackColor: Colors.white,
                thumbColor: Colors.white,
                overlayColor: Colors.white24,
                //overlayShape: RoundSliderOverlayShape(),
                ),
                child: Slider(value: height.toDouble(),
                  min: 120,max: 220,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.toInt();
                    });
                  },
                )
              ),
            ],
          ),
        ),
        Row(
          children: [
            block(
            CardColor: selectedBlockColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('WEIGHT',style: TextStyle(color: Colors.white,fontSize: 20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(weight.toString(), style: TextStyle(color: Colors.white,fontSize: 50),),
                    Text('Kg',style: TextStyle(color: Colors.white, fontSize: 20),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.white,shape: const CircleBorder()),
                      onPressed: (){
                        setState(() {
                          weight = weight+1;
                        });
                      },
                        child: Icon(FontAwesomeIcons.plus,color: Colors.black),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.white,shape: const CircleBorder()),
                      onPressed: (){
                        if(weight>0) {
                          setState(() {
                            weight = weight - 1;
                          });
                        }
                      },
                      child: Icon(FontAwesomeIcons.minus,color: Colors.black),
                    )
                  ],
                )
              ],
            ),
            ),
            block(
              CardColor: selectedBlockColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('AGE',style: TextStyle(color: Colors.white,fontSize: 20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(age.toString(), style: TextStyle(color: Colors.white,fontSize: 50),),
                      Text('yrs',style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.white,shape: const CircleBorder()),
                        onPressed: (){
                          setState(() {
                            age = age+1;
                          });
                        },
                        child: Icon(FontAwesomeIcons.plus,color: Colors.black),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.white,shape: const CircleBorder()),
                        onPressed: (){
                          if(age>0) {
                            setState(() {
                              age = age - 1;
                            });
                          }
                        },
                        child: Icon(FontAwesomeIcons.minus,color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        BottomButton(OnTap: (){
          calculate calc = calculate(height: height, weight: weight);

          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  result(bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  )
              )
            );
          },
            title: 'CALCULATE'
        )
      ],
    );
  }
}


