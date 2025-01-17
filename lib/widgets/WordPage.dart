import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class WordPage extends StatelessWidget {
  final GlobalKey columnKey;
  final Map<String, String> wordData;

  const WordPage({super.key, required this.columnKey, required this.wordData});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Showcase(
        key: columnKey,
        title: "Swipe",
        titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black87),
        description: "Discover more! Swipe up (↑) or down (↓) to explore new words or revisit your favorites. Keep learning and expanding your vocabulary with ease.",
        descTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black54),
        targetShapeBorder: RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                wordData["word"]!,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  letterSpacing: 1,
                  fontSize: 30
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                wordData["pronunciation"]!,
                style: Theme.of(context).textTheme.titleMedium!,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "(${wordData["part_of_speech"]!}) ${wordData["definition"]!}",
                style: Theme.of(context).textTheme.titleMedium!,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                wordData["example"]!,
                textAlign: TextAlign.center,

              ),
            ],
          ),
        ),
      ),
    );
  }
}