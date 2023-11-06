import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'calculator_brain.dart';

class result extends StatelessWidget {

  result({required this.bmiResult,required this.resultText,required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            primary: Color(0xFF0A0E21),
            secondary: Colors.purple),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          children: [
            Text(
              'Your Result',
              style: numberTextStyle,
            ),
            Expanded(
              child: ReusableCard(
                inactiveCardcolor,
                Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          resultText,
                          style: TextStyle(
                              color: Colors.lightGreenAccent, fontSize: 25),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      bmiResult,
                      style: numberTextStyle.copyWith(fontSize: 70),
                    )),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Center(
                          child: Text(
                            interpretation,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 90,
                width: double.infinity,
                color: Color(0xFFEC1056),
                margin: EdgeInsets.only(top: 7),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   color: Color(0xFFEC1056),
                // ),
                child: Center(
                    child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 27),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
