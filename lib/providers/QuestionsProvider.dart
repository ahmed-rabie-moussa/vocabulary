import 'package:flutter/material.dart';

class QuestionsProvider with ChangeNotifier {
  static final List<Map<String, dynamic>> questionAndChoices = [
    {
      "title": "Goal",
      "question": "Do you have a specific goal in mind?",
      "description": "Select an option to continue",
      "options": [
        "Enhance my lexicon",
        "Get ready for a test",
        "Improve my job prospect",
        "Enjoy learning new words",
        "Other"
      ]
    },
    {
      "title": "Topics",
      "question": "Which topics are you interested in?",
      "description": "Select an option to continue",
      "options": [
        "Society",
        "Words in foreign languages",
        "Human body",
        "Emotions",
        "Business",
        "Other"
      ]
    },
    {
      "title": "Age",
      "question": "How old are you",
      "description": "Your age is used to personalize your content",
      "options": [0, 100]
    },
    {
      "title": "Level",
      "question": "What's your vocabulary level?",
      "description": "Select an option to continue",
      "options": [
        "Beginner",
        "Intermediate",
        "Advanced",
      ],
      "desc_options":[
        "Basic words for everyday use",
        "Expand your vocabulary with common phrases and expressions",
        "Master complex words and idioms for fluent communication"
      ]
    },
  ];
  Map<String, String> answers = {};
  int activeCurrentStep = 0;
  double age = 18;


}