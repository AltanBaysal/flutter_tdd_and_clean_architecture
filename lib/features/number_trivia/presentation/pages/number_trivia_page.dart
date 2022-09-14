import 'package:flutter/material.dart';
import 'package:flutter_tdd_and_clean_architecture/core/constants/text_constants.dart';
import '../widgets/widgets.dart';


class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(EnglishText.numberTrivia),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                SizedBox(height: 10),
                NumberTriviaStatusViewChooser(),
                SizedBox(height: 20),
                TriviaControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

