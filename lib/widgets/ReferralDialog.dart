import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../utils/HapticsHelpper.dart';

class ReferralDialog extends StatefulWidget {
  const ReferralDialog({super.key});

  @override
  State<ReferralDialog> createState() => _ReferralDialogState();
}

class _ReferralDialogState extends State<ReferralDialog> {
  String question = 'How did you hear about Vocabulary?';

  final List<String> referralOptions = [
    'TikTok',
    'Instagram',
    'Facebook',
    'App Store',
    'Web Search',
    'Friend/Family',
    'Other',
  ];


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(question, style: Theme.of(context).textTheme.displayMedium,),
      titlePadding: EdgeInsets.only(top: 30,left: 12, right: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Round corners with radius 12
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      content: SingleChildScrollView(
        child: ListBody(
          children: referralOptions
              .map((option) => ListTile(
            title: Text(option,style: Theme.of(context).textTheme.titleMedium,),
            onTap: () {
              // Handle the user's selection
              _handleReferralSelection(context, option);
            },
          ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Handle dismiss action

            Navigator.of(context).pop();
          },
          child: Text('Dismiss',style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Color(0xff99BEBF)) ),
        ),
      ],
    );
  }

  void _handleReferralSelection(BuildContext context, String selectedOption) async {
    // Handle the selected referral option
    print('User selected: $selectedOption');
    await HapticsHelper.vibrate(HapticsType.selection);

    // Close the dialog
    Navigator.of(context).pop();
  }

}
