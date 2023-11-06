import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.white,
      //     primary: Color(0xFF0A0E21),
      //     secondary: Colors.purple
      //   ),
      //   scaffoldBackgroundColor: Color(0xFF0A0E21),
      //   textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white))
      // ),
      theme: ThemeData.dark().copyWith(

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: Color(0xFF0A0E21),
          secondary: Colors.purple
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // useMaterial3: true,
      ),
      home: InputPage(),
    );
  }
}

