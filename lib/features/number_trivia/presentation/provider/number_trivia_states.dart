

import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_and_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaState extends Equatable{}

class Empty extends NumberTriviaState{
  @override
  List<Object?> get props => [];
}

class Loading extends NumberTriviaState{
  @override
  List<Object?> get props => [];
}

class Loaded extends NumberTriviaState{
  final NumberTrivia trivia;
  Loaded({required this.trivia});

  @override
  List<Object?> get props => [trivia];
}

class Error extends NumberTriviaState{
  final String message;
  Error({required this.message});

  @override
  List<Object?> get props => [];
}