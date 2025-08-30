import 'package:flutter/material.dart';
import 'package:improve_memory/resources/asset_resource.dart';
import 'package:improve_memory/resources/extensions.dart';
import 'package:improve_memory/resources/string_resource.dart';
import 'package:improve_memory/resources/edge_insets_manager.dart';
import 'package:improve_memory/resources/text_styles.dart';
import 'package:improve_memory/screens/reading_fast/eye_shot_retention.dart';
import 'package:improve_memory/screens/reading_fast/zigzag_reading.dart';
import 'package:improve_memory/screens/reading_fast_training_screen.dart';

class ImprovingReadingSpeed extends StatelessWidget {
  const ImprovingReadingSpeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResource.improvingReadingSpeed),
      ),
      body: Padding(
        padding: e_8_all,
        child: Column(
          spacing: 15,
          children: [
            ExerciseItem(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => IncreaseEyeShotRetentionScreen(),
                  ),
                );
              },
              leading: Text(
                StringResource.oneToFour,
                style: h1PurpleTextStyle,
              ),
              title: StringResource.increaseEyeShotRetentionFromNumbers,
            ),
            ExerciseItem(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ReadingFastTrainingScreen(),
                  ),
                );
              },
              leading: S100Image.asset(
                AssetIcon.skim,
              ),
              title: StringResource.eyeSkimmingTraining,
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({
    super.key,
    required this.onPressed,
    required this.leading,
    required this.title,
  });

  final Widget leading;
  final GestureTapCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(60)),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(60)),
        ),
        child: InkWell(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(60)),
          onTap: onPressed,
          child: SizedBox(
            width: double.infinity,
            height: 90,
            child: Padding(
              padding: e_8_all,
              child: Row(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      child: FittedBox(child: leading)),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        title,
                        style: h4TextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
