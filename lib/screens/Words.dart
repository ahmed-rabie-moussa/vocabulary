import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:vocabulary_app/providers/ThemeProvider.dart';
import 'package:vocabulary_app/providers/WordsProvider.dart';
import 'package:vocabulary_app/widgets/ThemeSelectDialog.dart';

import '../widgets/WordPage.dart';

class Words extends StatefulWidget {
  const Words({super.key});

  @override
  State<Words> createState() => _WordsState();
}

class _WordsState extends State<Words>  {
  final GlobalKey _themesKey = GlobalKey();
  final GlobalKey _textKey = GlobalKey();
  final GlobalKey _progressKey = GlobalKey();

  int wordNumber = 1;
  bool _firstBuild = true;

  @override
  void didChangeDependencies() async{
    if (_firstBuild){
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('showcase') ?? true){
      ShowCaseWidget.of(context).startShowCase([_themesKey, _textKey, _progressKey]);
      prefs.setBool('showcase', false);
        _firstBuild = false;
    } }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final randomWords = context.read<WordsProvider>().getRandomWords();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: context.read<ThemeProvider>().selectedThemeName == null ||
                    context.read<ThemeProvider>().selectedThemeName == "light" ||
                    context.read<ThemeProvider>().selectedThemeName == "dark"
        ? null:DecorationImage(
                  image: AssetImage(ThemeProvider.themes[context.read<ThemeProvider>().selectedThemeName][0]), // Path to your image
                  fit: BoxFit.cover, // Adjust the image fit
                )
            ),
          ),
          Container(
            color: context.watch<ThemeProvider>().themeMode == ThemeMode.dark ?
            Colors.black.withAlpha(150):Color(0xffE6E2D8).withAlpha(190)
            ,
          ),
          Center(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: randomWords.length,
              onPageChanged: (index) => setState(() {
                wordNumber = index +1;
              }),
              itemBuilder: (context, index) {
                final wordData = randomWords[index];
                return WordPage(columnKey: (index == 0) ? _textKey: GlobalKey() ,wordData: wordData);
              },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
              child: InkWell(
                onTap: () {
                  _showDialog(context); // Show dialog when tapped
               },
                child: Showcase(
                  key: _themesKey,
                  title: "Themes",
                  titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black87),
                  description: "Customize your experience! Tap here to change the theme and background. Choose from a variety of colors and styles to make the app truly yours.",
                  descTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black54),
                  targetShapeBorder: CircleBorder(),
                  child:
                    Container(
                     padding: EdgeInsets.all(8),
                     decoration: BoxDecoration(
                       shape: BoxShape.circle, // Makes the container circular
                       color: Colors.white, // Background color of the circle
                       boxShadow: [
                         BoxShadow(
                           color:
                               Colors.black.withAlpha(60), // Shadow color
                           spreadRadius: 0, // How far the shadow spreads
                           blurRadius: 16, // How blurry the shadow is
                           offset: Offset(0, 0), // Shadow position (x, y)
                         ),
                       ],
                     ),
                     child: Image.asset(
                       'assets/icon/themes.png',
                       width: 30,
                       height: 30,
                       color: Colors.black,
                       fit: BoxFit.cover,
                     ),
                    ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child:  Padding(
              padding: const EdgeInsets.only(top: 79),
              child: Showcase(
                key: _progressKey,
                title: "Progress",
                titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black87),
                description: "Track your progress! The linear progress bar shows how many words you've learned. Stay motivated as you watch your vocabulary grow",
                descTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black54),
                targetShapeBorder: CircleBorder(),
                child: Container(
                  width: 136,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(120),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color:
                        Colors.black.withAlpha(10), // Shadow color
                        spreadRadius: 0, // How far the shadow spreads
                        blurRadius: 16, // How blurry the shadow is
                        offset: Offset(0, 0), // Shadow position (x, y)
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${wordNumber}/5",
                      style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: wordNumber/5.0,
                          backgroundColor: Colors.grey,
                          color: Colors.black,
                          minHeight: 6,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.black), // Set the color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ThemeSelectDialog();
  });
  }
}
