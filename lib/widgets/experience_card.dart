import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/cv_model.dart';
import '../themes/app_theme.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;
  final int index;

  const ExperienceCard({
    super.key,
    required this.experience,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.cardDecoration,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.title,
            style: AppTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                experience.company,
                style: AppTheme.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (experience.duration != null) ...[
                const SizedBox(width: 8),
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.textSecondaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  experience.duration!,
                  style: AppTheme.bodyMedium,
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          ...experience.responsibilities.map((resp) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: AppTheme.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        resp,
                        style: AppTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              )),
          if (experience.repositories != null &&
              experience.repositories!.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Repositories:',
              style: AppTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: experience.repositories!
                  .map(
                    (repo) => ElevatedButton.icon(
                      onPressed: () async {
                        final Uri url = Uri.parse('https://${repo.url}');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      icon: const Icon(Icons.code),
                      label: Text(repo.name),
                      style: AppTheme.primaryButtonStyle,
                    ),
                  )
                  .toList(),
            ),
          ],
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: (100 + (index * 100)).ms)
        .slideY(
            begin: 0.2,
            end: 0,
            duration: 600.ms,
            delay: (100 + (index * 50)).ms,
            curve: Curves.easeOutQuad);
  }
} 