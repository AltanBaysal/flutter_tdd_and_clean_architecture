import 'package:flutter/material.dart';
import '../widgets/widgets.dart';


class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Trivia"), //?
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

