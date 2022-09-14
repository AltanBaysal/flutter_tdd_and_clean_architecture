import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/text_constants.dart';
import '../provider/number_trivia_controller.dart';
import '../provider/number_trivia_states.dart';
import 'widgets.dart';

class NumberTriviaStatusViewChooser extends StatelessWidget {
  const NumberTriviaStatusViewChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberTriviaController>(
      builder: (
        BuildContext context,
        NumberTriviaController value,
        Widget? child,
      ) {
        final state = value.currentState;
        if(state is Empty){
          return const MessageDisplay(message: EnglishText.emptyTriviaText);
        }
        if(state is Loading){
          return const LoadingWidget();
        }
        if(state is Loaded){
          return TriviaDisplay(numberTrivia: state.trivia);
        }
        if(state is Error){
           return MessageDisplay(message: state.message);
        }
        return const MessageDisplay(message: FailureText.unexpectedError); //? bunu eklemek zorunda kaldım
      },
    );
  }
}
