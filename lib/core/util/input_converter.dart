import 'package:dartz/dartz.dart';
import '../error/failures.dart';

class InputConverter{ 
  Either<Failure,int> stringToUnsignedInteger(String str){
    try {
      final int num = int.parse(str);
      if(num <0) throw const FormatException();
      return Right(num);
    } on FormatException{
      return Left(InvalidInputFailure());
    }
  }
}



class InvalidInputFailure extends Failure{
  @override
  List<Object?> get props => [];

}