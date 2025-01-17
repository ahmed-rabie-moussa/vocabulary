import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:vocabulary_app/providers/QuestionsProvider.dart';
import 'package:vocabulary_app/providers/ThemeProvider.dart';
import 'package:vocabulary_app/providers/WordsProvider.dart';
import 'package:vocabulary_app/screens/Onboarding.dart';
import 'package:vocabulary_app/screens/Questions.dart';
import 'package:vocabulary_app/screens/Words.dart';
import 'package:vocabulary_app/utils/AppTheme.dart';
import 'package:vocabulary_app/utils/PageRouteTransition.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Check user skipped On Boarding
  final prefs = await SharedPreferences.getInstance();
  final showOnBoarding = prefs.getBool('showOnBoarding') ?? true;
  final showQuestions = prefs.getBool('showQuestions') ?? true;
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WordsProvider()),
        ChangeNotifierProvider(create: (_) => QuestionsProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider())
      ],
      child: MyApp(
        showOnBoarding: showOnBoarding,
        showQuestions: showQuestions,
      )));
}

class MyApp extends StatelessWidget {
  final bool showOnBoarding;
  final bool showQuestions;
  const MyApp(
      {super.key, required this.showOnBoarding, required this.showQuestions});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      initialRoute: showOnBoarding
          ? '/'
          : showQuestions
              ? '/questions'
              : '/words',
      // initialRoute: '/',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,

      onGenerateRoute: (settings) {
        return SlideRoute(
          builder: (context) {
            switch (settings.name) {
              case '/questions':
                return Questions();
              case '/words':
                return ShowCaseWidget(
                  builder: (context) {
                    return Words();
                  }
                );
              default:
                return Onboarding();
            }
          },
        );
      },
    );
  }
}
