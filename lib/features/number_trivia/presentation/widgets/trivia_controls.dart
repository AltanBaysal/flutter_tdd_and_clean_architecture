import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/number_trivia_controller.dart';

class TriviaControls extends StatelessWidget {
  const TriviaControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberTriviaController numberTriviaController = Provider.of<NumberTriviaController>(context);
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Input a number", //?
          ),
          controller: numberTriviaController.triviaTextEditingController,
          onSubmitted: (value) {
            numberTriviaController.getTriviaForConcreteNumber();
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: numberTriviaController.getTriviaForConcreteNumber,
                child: const Text("Search"), //?
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Get random trivia"), //?
              ),
            ),
          ],
        ),
      ],
    );
  }
}
