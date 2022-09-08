import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable {
  final String text;
  final int number;

  const NumberTrivia({
    required this.text,
    required this.number,
  });
  
  
  //! equatable kullanımım doğru mu ? videoda super dan aktardı
  @override
  List<Object?> get props => [text,number];
}
