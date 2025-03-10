import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/cv_model.dart';
import '../../themes/app_theme.dart';

class HeroSection extends StatelessWidget {
  final CV cv;

  const HeroSection({super.key, required this.cv});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(MOBILE);

    return Container(
      height: screenSize.height,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48.0 : 24.0,
        vertical: 48.0,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7F00FF),
            Color(0xFF6200EE),
            Color(0xFF3700B3),
          ],
        ),
      ),
      child: Center(
        child: ResponsiveRowColumn(
          rowMainAxisAlignment: MainAxisAlignment.center,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          columnMainAxisAlignment: MainAxisAlignment.center,
          columnCrossAxisAlignment: CrossAxisAlignment.center,
          layout: isDesktop
              ? ResponsiveRowColumnType.ROW
              : ResponsiveRowColumnType.COLUMN,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 48.0 : 0,
                  vertical: isDesktop ? 0 : 24.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: isDesktop
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hello, I\'m',
                      style: AppTheme.headlineMedium.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                      textAlign:
                          isDesktop ? TextAlign.right : TextAlign.center,
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideX(
                            begin: -0.2,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOutQuad),
                    const SizedBox(height: 8),
                    Text(
                      cv.personalInfo.name,
                      style: AppTheme.headlineLarge.copyWith(
                        color: Colors.white,
                        fontSize: isDesktop ? 64 : 48,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign:
                          isDesktop ? TextAlign.right : TextAlign.center,
                    )
                        .animate()
                        .fadeIn(duration: 800.ms, delay: 300.ms)
                        .slideX(
                            begin: -0.2,
                            end: 0,
                            duration: 800.ms,
                            delay: 300.ms,
                            curve: Curves.easeOutQuad),
                    const SizedBox(height: 16),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          cv.personalInfo.title,
                          textStyle: AppTheme.titleLarge.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                          speed: const Duration(milliseconds: 60),
                        ),
                      ],
                      totalRepeatCount: 1,
                      displayFullTextOnTap: true,
                    ),
                    const SizedBox(height: 32),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: isDesktop
                          ? WrapAlignment.end
                          : WrapAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                            final section = screenSize.height;
                            await Scrollable.ensureVisible(
                              context,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              alignment: section,
                            );
                          },
                          icon: const Icon(Icons.person),
                          label: const Text('About Me'),
                          style: AppTheme.primaryButtonStyle.copyWith(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(
                                AppTheme.primaryColor),
                          ),
                        )
                            .animate(delay: 1200.ms)
                            .fadeIn(duration: 600.ms)
                            .slideY(
                                begin: 0.2,
                                end: 0,
                                duration: 600.ms,
                                curve: Curves.easeOutQuad),
                        OutlinedButton.icon(
                          onPressed: () async {
                            final section = screenSize.height * 6;
                            await Scrollable.ensureVisible(
                              context,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              alignment: section,
                            );
                          },
                          icon: const Icon(Icons.email),
                          label: const Text('Contact Me'),
                          style: AppTheme.outlinedButtonStyle.copyWith(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.white),
                            ),
                          ),
                        )
                            .animate(delay: 1400.ms)
                            .fadeIn(duration: 600.ms)
                            .slideY(
                                begin: 0.2,
                                end: 0,
                                duration: 600.ms,
                                curve: Curves.easeOutQuad),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: isDesktop
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            final Uri url = Uri.parse(
                                'https://${cv.personalInfo.contact.github}');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          },
                          icon: const FaIcon(FontAwesomeIcons.github),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () async {
                            final Uri url = Uri.parse(
                                'https://${cv.personalInfo.contact.linkedin}');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          },
                          icon: const FaIcon(FontAwesomeIcons.linkedin),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () async {
                            final Uri url = Uri.parse(
                                'mailto:${cv.personalInfo.contact.email}');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          },
                          icon: const FaIcon(FontAwesomeIcons.envelope),
                          color: Colors.white,
                        ),
                      ],
                    )
                        .animate(delay: 1600.ms)
                        .fadeIn(duration: 600.ms)
                        .slideY(
                            begin: 0.2,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOutQuad),
                  ],
                ),
              ),
            ),
            if (isDesktop)
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Center(
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Center(
                      child: Container(
                        width: 380,
                        height: 380,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(190),
                        ),
                        child: Center(
                          child: Container(
                            width: 320,
                            height: 320,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(160),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.person,
                                size: 160,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 800.ms)
                      .scaleXY(
                          begin: 0.8,
                          end: 1,
                          duration: 800.ms,
                          delay: 800.ms,
                          curve: Curves.easeOutBack),
                ),
              ),
          ],
        ),
      ),
    );
  }
} 