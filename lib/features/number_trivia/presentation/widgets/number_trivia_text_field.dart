import 'package:flutter/material.dart';
import 'package:flutter_tdd_and_clean_architecture/core/constants/text_constants.dart';
import 'package:provider/provider.dart';
import '../provider/number_trivia_controller.dart';

class NumberTriviaTextField extends StatelessWidget {
  const NumberTriviaTextField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberTriviaController>(
      builder: (
        BuildContext context,
        NumberTriviaController numberTriviaController,
        Widget? child,
      ) {
        return TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: EnglishText.inputNumber,
          ),
          controller: numberTriviaController.triviaTextEditingController,
          onSubmitted: (value) {
            numberTriviaController.getTriviaForConcreteNumber();
          },
        );
      },
    );
  }
}