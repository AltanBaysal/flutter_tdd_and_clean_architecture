import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_tdd_and_clean_architecture/injection_container.dart' as di;
import '../../features/number_trivia/presentation/provider/number_trivia_controller.dart';

class MainProviderList{
  static final List<SingleChildWidget> mainProviderlist = [
    ChangeNotifierProvider<NumberTriviaController>(
      create: (final _) => di.sl(),
    ),
  ];
}