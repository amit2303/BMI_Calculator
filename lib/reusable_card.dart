import 'package:flutter/material.dart';

class reusableCard extends StatelessWidget {
  const reusableCard(this.varcolor, this.icon);
  final Color varcolor;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.infinity,
      margin: EdgeInsets.all(7),
      // padding: EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: varcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: icon,
    );
  }
}
