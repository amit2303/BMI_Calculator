import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


const lableTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF797889),
);

const numberTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);
class iconContent extends StatelessWidget {

  final IconData iconImg;
  final String textVal;

  iconContent(this.iconImg,this.textVal);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          iconImg,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          textVal,
          style: lableTextStyle,
        ),
      ],
    );
  }
}