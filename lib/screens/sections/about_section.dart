import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../models/cv_model.dart';
import '../../themes/app_theme.dart';
import '../../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  final CV cv;

  const AboutSection({super.key, required this.cv});

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
          const SectionTitle(title: 'About Me'),
          const SizedBox(height: 24),
          ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            columnMainAxisAlignment: MainAxisAlignment.center,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            layout: isDesktop
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            children: [
              if (isDesktop)
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 160,
                          color: Colors.white,
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideX(
                            begin: -0.2,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOutQuad),
                  ),
                ),
              ResponsiveRowColumnItem(
                rowFlex: isDesktop ? 1 : 0,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Who am I?',
                        style: AppTheme.headlineSmall,
                      )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .slideY(
                              begin: 0.2,
                              end: 0,
                              duration: 600.ms,
                              curve: Curves.easeOutQuad),
                      const SizedBox(height: 16),
                      Text(
                        cv.professionalSummary,
                        style: AppTheme.bodyLarge,
                      )
                          .animate()
                          .fadeIn(duration: 600.ms, delay: 200.ms)
                          .slideY(
                              begin: 0.2,
                              end: 0,
                              duration: 600.ms,
                              delay: 200.ms,
                              curve: Curves.easeOutQuad),
                      const SizedBox(height: 24),
                      if (cv.achievements.isNotEmpty) ...[
                        Text(
                          'Achievements',
                          style: AppTheme.headlineSmall,
                        )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 400.ms)
                            .slideY(
                                begin: 0.2,
                                end: 0,
                                duration: 600.ms,
                                delay: 400.ms,
                                curve: Curves.easeOutQuad),
                        const SizedBox(height: 16),
                        ...cv.achievements.expand((achievement) {
                          return [
                            Text(
                              achievement.title,
                              style: AppTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            ...achievement.items.map(
                              (item) => Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.emoji_events,
                                      color: AppTheme.primaryColor,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          style: AppTheme.bodyMedium,
                                          children: [
                                            TextSpan(
                                              text: '${item.position} - ',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${item.event} (${item.year})',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ];
                        }).toList(),
                      ],
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