import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  // const ReusableCard({
  //   super.key,
  // });

  ReusableCard(this.colour, this.cardChild);
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.infinity,
      child: cardChild,
      margin: EdgeInsets.all(7),
      // padding: EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}