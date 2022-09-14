import 'package:flutter/cupertino.dart';
import 'package:flutter_tdd_and_clean_architecture/core/usecases/usecase.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/input_converter.dart';
import '../../domain/usecases/get_random_number_trivia.dart';
import '../../domain/usecases/get_concrete_number_trivia.dart';
import 'number_trivia_states.dart';

class NumberTriviaController with ChangeNotifier {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  final TextEditingController triviaTextEditingController =
      TextEditingController();
  NumberTriviaState currentState = Empty();

  NumberTriviaController({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  });

//? çok büyük mü oldu fonksiyon
  void getTriviaForConcreteNumber() {
    final inputEither = inputConverter.stringToUnsignedInteger(
      triviaTextEditingController.text,
    );
    inputEither.fold(
      (failure) {
        _setCurrentTriviaState(
          numberTriviaState: Error(message: failure.text),
        );
      },
      (integer) async {
        triviaTextEditingController.clear();
        _setCurrentTriviaState(numberTriviaState: Loading());
        final failureOrTrivia = await getConcreteNumberTrivia(
          Params(number: integer),
        );
        failureOrTrivia.fold(
          (failure) => _setCurrentTriviaState(
            numberTriviaState: Error(message: failure.text),
          ),
          (trivia) => _setCurrentTriviaState(
            numberTriviaState: Loaded(trivia: trivia),
          ),
        );
      },
    );
  }

  void getTriviaForRandomNumber() async {
    _setCurrentTriviaState(numberTriviaState: Loading());
    final failureOrTrivia = await getRandomNumberTrivia(NoParams());
    failureOrTrivia.fold(
      (failure) => _setCurrentTriviaState(
        numberTriviaState: Error(message: failure.text),
      ),
      (trivia) => _setCurrentTriviaState(
        numberTriviaState: Loaded(trivia: trivia),
      ),
    );
  }

  void _setCurrentTriviaState({required NumberTriviaState numberTriviaState}) {
    currentState = numberTriviaState;
    notifyListeners();
  }
}

//? bunu buraya koydum ama doğru gelmedi
extension on Failure {
  String get text {
    switch (runtimeType) {
      case ServerFailure:
        return FailureText.serverFailureMessage;
      case CacheFailure:
        return FailureText.cacheFailureMessage;
      case InvalidInputFailure:
        return FailureText.invalidInputFailureMessage;
      default:
        return FailureText.unexpectedError;
    }
  }
}
