import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class icon_content extends StatelessWidget {
  final IconData varIcon;
  final String gender;

  const icon_content(this.varIcon, this.gender);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            varIcon,
            size: 80,
            color: Color.fromARGB(255, 150, 148, 169),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF797889),
          ),
        )
      ],
    );
  }
}
