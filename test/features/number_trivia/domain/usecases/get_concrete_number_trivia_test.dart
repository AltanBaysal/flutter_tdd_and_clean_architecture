import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_and_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_tdd_and_clean_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_tdd_and_clean_architecture/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}


@GenerateMocks([MockNumberTriviaRepository])
void main() {
  late GetConcreteNumberTrivia usecase; //? orjinalde yine late yok
  late MockNumberTriviaRepository mockNumberTriviaRepository; //? orjinalinde late yok  setUpda atadığım halde yinede hata veriyor

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: "test", number: 1); 

  test(
    'should get trivia for the number from the repository',
    () async {
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber)) //? burda tNumber yerine any olacak ama any hata veriyor ?
      .thenAnswer((_) async => Right(tNumberTrivia));

      final result = await usecase.execute(number : tNumber); 

      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
