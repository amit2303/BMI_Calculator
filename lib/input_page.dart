import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'customwidget.dart';
import 'calculator_brain.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color activeCardcolor = Color(0xFF1D1F31);
Color inactiveCardcolor = Color(0xFF111328);

Color maleCardcolor = inactiveCardcolor;
Color femaleCardcolor = inactiveCardcolor;

class _InputPageState extends State<InputPage> {
  int _currentSliderValue = 30;
  int weight = 50;
  int age = 15;
  int height =150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (maleCardcolor == inactiveCardcolor) {
                          maleCardcolor = activeCardcolor;
                          femaleCardcolor = inactiveCardcolor;
                        } else {
                          maleCardcolor = inactiveCardcolor;
                        }
                      });
                    },
                    child: ReusableCard(
                      maleCardcolor,
                      iconContent(FontAwesomeIcons.mars, 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (femaleCardcolor == inactiveCardcolor) {
                          femaleCardcolor = activeCardcolor;
                          maleCardcolor = inactiveCardcolor;
                        } else {
                          femaleCardcolor = inactiveCardcolor;
                        }
                      });
                    },
                    child: ReusableCard(
                      femaleCardcolor,
                      iconContent(FontAwesomeIcons.venus, 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              inactiveCardcolor,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: lableTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(_currentSliderValue.toString(),
                          style: numberTextStyle),
                      Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlappingShapeStrokeColor: Color(0xFFEC1056),
                      thumbColor: Color(0xFFEC1056),
                      overlayColor: Color(0x29EC1056),
                      inactiveTrackColor: Color(0xFF797889),
                      activeTrackColor: Color(0xFFEC1056),
                    ),
                    child: Slider(
                      value: _currentSliderValue.toDouble(),
                      max: 200,
                      // divisions: 10,
                      // label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      inactiveCardcolor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: lableTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  weight--;
                                });
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  weight++;
                                });
                              }),
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      inactiveCardcolor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: lableTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  age--;
                                });
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              }),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(weight, _currentSliderValue);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => result(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation()),
                ),
              );
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
                'CALCULATE',
                style: TextStyle(fontSize: 27),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
