import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/customwidget.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'result_page.dart';
import 'calculator_brain.dart';
import 'constants.dart';

class input_page extends StatefulWidget {
  const input_page({super.key});

  @override
  State<input_page> createState() => _input_pageState();
}

const Color activeCardcolor = Color(0xFF1D1F31);
const Color inactiveCardcolor = Color(0xFF111328);

Color maleCardcolor = inactiveCardcolor;
Color femaleCardcolor = inactiveCardcolor;
int currentSliderValue = 30;
int weight = 50;
int age = 15;
int height = 150;

CalculatorBrain calc = CalculatorBrain(weight, height);

class _input_pageState extends State<input_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: lableTextStyle,
        ),
        backgroundColor: Color.fromARGB(255, 13, 10, 39),
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
                  child: reusableCard(maleCardcolor,
                      icon_content(FontAwesomeIcons.mars, "MALE")),
                )),
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
                  child: reusableCard(
                      femaleCardcolor, icon_content(Icons.female, "FEMALE")),
                ))
              ],
            ),
          ),
          Expanded(
            child: reusableCard(
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
                      Text(currentSliderValue.toString(),
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
                      inactiveTrackColor: Color.fromARGB(255, 207, 206, 228),
                      activeTrackColor: Color(0xFFEC1056),
                    ),
                    child: Slider(
                      value: currentSliderValue.toDouble(),
                      max: 200,
                      onChanged: (double value) {
                        setState(() {
                          currentSliderValue = value.toInt();
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
                  child: reusableCard(
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
                              MyIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  weight--;
                                });
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              MyIconButton(FontAwesomeIcons.plus, () {
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
                  child: reusableCard(
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
                              MyIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  age--;
                                });
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              MyIconButton(FontAwesomeIcons.plus, () {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => result(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation())));
            },
            child: Container(
              height: 90,
              width: double.infinity,
              color: const Color(0xFFEC1056),
              child: const Center(
                  child: Text(
                "CALCULATE",
                style: TextStyle(fontSize: 27),
              )),
            ),
          )
        ],
      ),
    );
  }
}
