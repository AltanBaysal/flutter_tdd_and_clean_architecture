import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

import 'features/number_trivia/presentation/pages/number_trivia_page.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Number Trivia", //?
      home: NumberTriviaPage(),
    );
  }
}