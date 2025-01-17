import 'package:circular_progress_button/circular_progress_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocabulary_app/utils/Constants.dart';
import 'package:vocabulary_app/widgets/ReferralDialog.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  static const List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/ob1.png",
      "text": "Expand Your Vocabulary in 1 minute a day",
      "description":
          "Learn 10,000+ new words with a new daily habit that takes just 1 minute"
    },
    {
      "image": "assets/ob2.png",
      "text": "Let's make Vocabulary yours",
      "description": "Customize the app to make the most of your experience"
    },
    {
      "image": "assets/ob3.png",
      "text": "Achieve your goals with Vocabulary",
      "description": "Stay motivated and track your progress every day"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: PageView.builder(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    _onboardingData.elementAt(index)["image"]!,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          _onboardingData.elementAt(index)["text"]!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          _onboardingData.elementAt(index)["description"]!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            },
          )),
          SizedBox(height: 40),
          CircularProgressButton(
            onTap: () => (_controller.page == 2)
                ? null
                : _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut),
            onComplete: () async{
              Navigator.of(context).pushReplacementNamed("/questions");
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showOnBoarding', false);
              _showReferralDialog(context);
            },
            animationDuration: const Duration(milliseconds: 500),
            totalSteps: 3,
            currentStep: _controller.initialPage,
            theme: ProgressButtonTheme(
                backgroundColor: Color(0xff91BDBE),
                progressColor: Color(0xffed9382),
                iconColor: Color(0xff000000)),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }

  void _showReferralDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allow dismissing by tapping outside
      builder: (BuildContext context) {
        return ReferralDialog();
      },
    );
  }
}
