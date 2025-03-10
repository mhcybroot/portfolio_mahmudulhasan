import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../models/cv_model.dart';
import '../../themes/app_theme.dart';
import '../../widgets/experience_card.dart';
import '../../widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  final CV cv;

  const ExperienceSection({super.key, required this.cv});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(MOBILE);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48.0 : 24.0,
        vertical: 48.0,
      ),
      constraints: BoxConstraints(
        minHeight: screenSize.height,
      ),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SectionTitle(title: 'Experience'),
          const SizedBox(height: 24),
          ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            columnMainAxisAlignment: MainAxisAlignment.center,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            layout: isDesktop
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      for (int i = 0; i < cv.experience.length ~/ 2; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: ExperienceCard(
                            experience: cv.experience[i],
                            index: i,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      for (int i = cv.experience.length ~/ 2;
                          i < cv.experience.length;
                          i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: ExperienceCard(
                            experience: cv.experience[i],
                            index: i,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 