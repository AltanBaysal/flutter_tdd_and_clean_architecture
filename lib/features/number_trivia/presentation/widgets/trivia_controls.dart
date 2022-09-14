import 'package:flutter/material.dart';
import 'package:flutter_tdd_and_clean_architecture/core/constants/text_constants.dart';
import 'package:provider/provider.dart';
import '../provider/number_trivia_controller.dart';
import 'number_trivia_text_field.dart';

class TriviaControls extends StatelessWidget {
  const TriviaControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberTriviaController numberTriviaController =
        Provider.of<NumberTriviaController>(context);
    return Column(
      children: [
        const NumberTriviaTextField(),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: numberTriviaController.getTriviaForConcreteNumber,
                child: const Text(EnglishText.search),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: numberTriviaController.getTriviaForRandomNumber,
                child: const Text(EnglishText.getRandomTrivia),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

