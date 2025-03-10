import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../models/cv_model.dart';
import '../../themes/app_theme.dart';
import '../../widgets/section_title.dart';

class EducationSection extends StatelessWidget {
  final CV cv;

  const EducationSection({super.key, required this.cv});

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
      color: AppTheme.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SectionTitle(title: 'Education'),
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
              for (int i = 0; i < cv.education.length; i++)
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: AppTheme.cardDecoration,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cv.education[i].degree,
                            style: AppTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  cv.education[i].institution,
                                  style: AppTheme.bodyMedium.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: cv.education[i].status == 'Current'
                                      ? AppTheme.primaryColor
                                      : AppTheme.secondaryColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  cv.education[i].status,
                                  style: AppTheme.bodySmall.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (cv.education[i].batch != null) ...[
                            const SizedBox(height: 8),
                            Text(
                              'Batch: ${cv.education[i].batch}',
                              style: AppTheme.bodyMedium,
                            ),
                          ],
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 16),
                          if (cv.education[i].description != null) ...[
                            Text(
                              cv.education[i].description!,
                              style: AppTheme.bodyMedium,
                            ),
                            const SizedBox(height: 16),
                          ],
                          if (cv.education[i].coursework != null &&
                              cv.education[i].coursework!.isNotEmpty) ...[
                            Text(
                              'Coursework:',
                              style: AppTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: cv.education[i].coursework!
                                  .map(
                                    (course) => Chip(
                                      label: Text(course),
                                      backgroundColor:
                                          AppTheme.primaryColor.withOpacity(0.1),
                                      side: BorderSide.none,
                                      labelStyle: AppTheme.bodySmall.copyWith(
                                        color: AppTheme.primaryColor,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ],
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: (100 + (i * 100)).ms)
                        .slideY(
                            begin: 0.2,
                            end: 0,
                            duration: 600.ms,
                            delay: (100 + (i * 50)).ms,
                            curve: Curves.easeOutQuad),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
} 