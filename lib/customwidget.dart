import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyIconButton extends StatelessWidget {
  final IconData vIcon;
  final Function() whenPressed;

  const MyIconButton(this.vIcon, this.whenPressed);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color(0XFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: whenPressed,
      child: FaIcon(vIcon),
    );
  }
}
