import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../models/cv_model.dart';
import '../../themes/app_theme.dart';
import '../../widgets/section_title.dart';
import '../../widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  final CV cv;

  const SkillsSection({super.key, required this.cv});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).largerThan(MOBILE) &&
        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

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
        mainAxisSize: MainAxisSize.min,
        children: [
          const SectionTitle(title: 'Skills'),
          const SizedBox(height: 24),
          SizedBox(
            height: screenSize.height * 0.7,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: isDesktop
                  ? 3
                  : isTablet
                      ? 2
                      : 1,
              childAspectRatio: isDesktop ? 1.2 : 1.0,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              padding: const EdgeInsets.all(8),
              children: [
                SkillCard(
                  category: 'Mobile Development',
                  skills: cv.skills.mobileDevelopment,
                  icon: Icons.phone_android,
                ),
                SkillCard(
                  category: 'Backend & Desktop',
                  skills: cv.skills.backendAndDesktopDevelopment,
                  icon: Icons.computer,
                ),
                SkillCard(
                  category: 'IoT & Hardware',
                  skills: cv.skills.iotAndHardware,
                  icon: Icons.memory,
                ),
                SkillCard(
                  category: 'Networking & Security',
                  skills: cv.skills.networkingAndSecurity,
                  icon: Icons.security,
                ),
                SkillCard(
                  category: 'Linux & System Admin',
                  skills: cv.skills.linuxAndSystemAdministration,
                  icon: Icons.terminal,
                ),
                SkillCard(
                  category: 'Cloud & DevOps',
                  skills: cv.skills.cloudAndDevOps,
                  icon: Icons.cloud,
                ),
                SkillCard(
                  category: 'Soft Skills',
                  skills: cv.skills.softSkills,
                  icon: Icons.people,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 