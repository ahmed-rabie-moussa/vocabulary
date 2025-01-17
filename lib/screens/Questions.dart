import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocabulary_app/providers/QuestionsProvider.dart';
import 'package:vocabulary_app/widgets/AgeSelector.dart';
import 'package:vocabulary_app/widgets/AnswerSelector.dart';

import '../utils/HapticsHelpper.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    int activeCurrentStep =
        context.watch<QuestionsProvider>().activeCurrentStep;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "Tailor the app to suit your needs",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Stepper(
          currentStep: activeCurrentStep,
          steps: QuestionsProvider.questionAndChoices
              .map((qAndC) => Step(
                  title: Text(
                    qAndC["title"],
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  isActive: activeCurrentStep ==
                      QuestionsProvider.questionAndChoices.indexOf(qAndC),
                  state: activeCurrentStep ==
                          QuestionsProvider.questionAndChoices.indexOf(qAndC)
                      ? StepState.disabled
                      : activeCurrentStep >
                              QuestionsProvider.questionAndChoices
                                  .indexOf(qAndC)
                          ? StepState.complete
                          : StepState.disabled,
                  stepStyle: StepStyle(
                    color: activeCurrentStep >
                            QuestionsProvider.questionAndChoices.indexOf(qAndC)
                        ? Color(0xffed9382)
                        : Color(0xff91BDBE),
                    connectorColor: activeCurrentStep - 1 >
                            QuestionsProvider.questionAndChoices.indexOf(qAndC)
                        ? Color(0xffed9382)
                        : Color(0xff91BDBE),
                    connectorThickness: 2,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        qAndC["question"],
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      (QuestionsProvider.questionAndChoices.indexOf(qAndC) != 2)
                          ? AnswerSelector(
                              questionAndAnswers: qAndC,
                              addAnswerToMap: _addAnswerToQuestion,
                              title: qAndC['title'])
                          : AgeSelector(
                              addAnswerToMap: _addAnswerToQuestion,
                              title: qAndC['title'],
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      AnimatedOpacity(
                        opacity: !context
                                .read<QuestionsProvider>()
                                .answers
                                .containsKey(qAndC['title'])
                            ? 1.0
                            : 0.0,
                        duration: Duration(milliseconds: 300),
                        child: Text(
                          qAndC['description'],
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color(0xffed938e), fontSize: 14),
                        ),
                      )
                    ],
                  )))
              .toList(),

          onStepContinue: () async {
            if (activeCurrentStep <
                (QuestionsProvider.questionAndChoices.length - 1)) {
              setState(() {
                context.read<QuestionsProvider>().activeCurrentStep++;
              });
              await HapticsHelper.vibrate(HapticsType.success);
            } else {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showQuestions', false);
              Navigator.of(context).pushReplacementNamed("/words");
            }
          },
          onStepTapped: null,

          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: (context
                          .read<QuestionsProvider>()
                          .answers
                          .containsKey(QuestionsProvider.questionAndChoices
                              .elementAt(activeCurrentStep)["title"]))
                      ? controls.onStepContinue
                      : ()=> HapticsHelper.vibrate(HapticsType.error),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll((context
                            .read<QuestionsProvider>()
                            .answers
                            .containsKey(QuestionsProvider.questionAndChoices
                                .elementAt(activeCurrentStep)["title"]))
                        ? Color(0xffed9382)
                        : Color(0xff91BDBE)),
                  ),
                  child: Text(
                    'Continue',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            );
          },
          // connectorColor: MaterialStateProperty<Color>(Color(0xffed9382)),
          type: StepperType.horizontal,
          elevation: 0,
        ),
      ),
    );
  }

  void _addAnswerToQuestion(String title, String answer) {
    setState(() {
      context.read<QuestionsProvider>().answers[title] = answer;
    });
  }
}
