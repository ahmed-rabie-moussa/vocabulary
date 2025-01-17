import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../utils/HapticsHelpper.dart';

class AnswerSelector extends StatefulWidget {
  final Map<String, dynamic> questionAndAnswers;
  final Function addAnswerToMap;
  final String title;
  const AnswerSelector(
      {super.key,
      required this.questionAndAnswers,
      required this.addAnswerToMap,
      required this.title});

  @override
  State<AnswerSelector> createState() => _AnswerSelectorState();
}

class _AnswerSelectorState extends State<AnswerSelector> {
  String? _selectedValue;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 10,
      ),
      ...widget.questionAndAnswers['options'].map((option) {
        return RadioListTile<String>(
          dense: true,
          contentPadding: EdgeInsets.zero,
          title: Text(
            option,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: widget.questionAndAnswers.containsKey('desc_options')
              ? Text(
                  widget.questionAndAnswers['desc_options'].elementAt(
                      widget.questionAndAnswers['options'].indexOf(option)),
            style: Theme.of(context).textTheme.bodySmall,
                )
              : null,
          value: option,
          groupValue: _selectedValue,
          onChanged: (value) async {
            setState(() {
              _selectedValue = value; // Update the selected option
              widget.addAnswerToMap(widget.title, _selectedValue);
            });
            await HapticsHelper.vibrate(HapticsType.selection);

          },
        );
      }),
    ]);
  }
}
