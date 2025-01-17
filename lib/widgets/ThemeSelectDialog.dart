import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:provider/provider.dart';
import 'package:vocabulary_app/providers/ThemeProvider.dart';
import 'package:vocabulary_app/utils/HapticsHelpper.dart';

class ThemeSelectDialog extends StatelessWidget {
  const ThemeSelectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String?> imagePaths = [
      null,
      'assets/photos/nature.png',
      'assets/photos/sculpture.png',
      null,
    ];
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Which theme would you like to select?",
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: GridView.builder(
                // padding: EdgeInsets.all(16), // Padding around the grid
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 photos per row
                  crossAxisSpacing: 10, // Spacing between columns
                  mainAxisSpacing: 10, // Spacing between rows
                ),
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => _changeTheme(context, index),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Shadow color
                            spreadRadius: 2, // How far the shadow spreads
                            blurRadius: 5, // How blurry the shadow is
                            offset: Offset(0, 3), // Shadow position (x, y)
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Match container's border radius
                        child: Stack(
                          fit: StackFit.expand, // Fill the container
                          children: [
                            // Photo
                            if (index == 1 || index == 2)
                              Image.asset(
                                imagePaths[index]!,
                                fit: BoxFit.cover, // Cover the entire container
                              ),
                            Container(
                              color: index == 0
                                  ? Color(0xffE6E2D8)
                                  : index == 1
                                      ? Colors.black.withAlpha(80)
                                      : index == 2
                                          ? Color(0xffE6E2D8).withAlpha(120)
                                          : Colors.grey[900],
                            ),
                            // Centered text overlay
                            Center(
                              child: Text(
                                "Abcd",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: index % 2 == 0
                                            ? Colors.black87
                                            : Colors.white,
                                        fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeTheme(BuildContext context, int index) async{
    switch (index) {
      case 0:
        context.read<ThemeProvider>().changeThemeBackground("light");
        break;
      case 1:
        context.read<ThemeProvider>().changeThemeBackground("nature");
        break;
      case 2:
        context.read<ThemeProvider>().changeThemeBackground("sculpture");
        break;
      case 3:
        context.read<ThemeProvider>().changeThemeBackground("dark");
        break;
    }
    await HapticsHelper.vibrate(HapticsType.rigid);
    Navigator.of(context).pop();
  }
}
