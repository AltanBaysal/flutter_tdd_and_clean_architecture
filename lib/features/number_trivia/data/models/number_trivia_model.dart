import '../../domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({
    required String text,
    required int number,
  }) : super(text: text, number: number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      number: (json['number'] as num).toInt(),
    );
  }

  NumberTriviaModel.fromJsona(Map<String, dynamic> json) : super(text: json["text"],number: json["number"].toInt(),); //!


  Map<String, dynamic> toJson(){
    return {
      'text':text,
      'number' : number,
    };
  }
}


void main(List<String> args) {
  
}
