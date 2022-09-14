import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/main_provider_list.dart';
import 'core/constants/text_constants.dart';
import 'injection_container.dart' as di;
import 'features/number_trivia/presentation/pages/number_trivia_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiProvider(
      providers: MainProviderList.mainProviderlist,
      child: const MyApp(),
    )
  );
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: EnglishText.numberTrivia, 
      home: NumberTriviaPage(),
    );
  }
}