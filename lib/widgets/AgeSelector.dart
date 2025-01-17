import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:provider/provider.dart';
import 'package:vocabulary_app/providers/ThemeProvider.dart';

import '../utils/HapticsHelpper.dart';

class AgeSelector extends StatefulWidget {
  final Function addAnswerToMap;
  final String title;
  const AgeSelector({super.key, required this.addAnswerToMap, required this.title});

  @override
  State<AgeSelector> createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> {
  double age = 18;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Color(0xffed9382),
              borderRadius: BorderRadius.all(Radius.circular(4))
            ),
              child: Text(age.round().toString(), style: Theme.of(context).textTheme.titleMedium,),

          ),
          SizedBox(height: 20,),
          Slider(
            value: age,
            min: 6,
            max: 60,
            divisions: 55,
            label: age.round().toString(),
            activeColor: Color(0xffed9382),
            inactiveColor: Color(0xff91BDBE),
            thumbColor: context.watch<ThemeProvider>().themeMode == ThemeMode.light ? Colors.black: Colors.white,
            onChanged: (value) async {
              await HapticsHelper.vibrate(HapticsType.selection);
              setState(() {
                age = value;
                widget.addAnswerToMap(widget.title, age.toString());
              });
            },
          ),
        ],
      ),
    );
  }
}
