import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 7, 10, 22),
            primary: Color(0xFF0A0E21),
            secondary: Colors.purple),
        scaffoldBackgroundColor: Color(0xFF0A0E21)),
    home: input_page(),
  ));
}
