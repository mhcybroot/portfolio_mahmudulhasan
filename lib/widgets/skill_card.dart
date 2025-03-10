import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../themes/app_theme.dart';

class SkillCard extends StatelessWidget {
  final String category;
  final List<String> skills;
  final IconData icon;

  const SkillCard({
    super.key,
    required this.category,
    required this.skills,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 265,
      child: Container(
        decoration: AppTheme.cardDecoration,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: AppTheme.primaryColor,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    category,
                    style: AppTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: skills.map((skill) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: AppTheme.secondaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            skill,
                            style: AppTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: 100.ms)
        .slideY(begin: 0.2, end: 0, duration: 600.ms, curve: Curves.easeOutQuad);
  }
} 