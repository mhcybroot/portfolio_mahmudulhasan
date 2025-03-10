import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../themes/app_theme.dart';

class ProjectCard extends StatelessWidget {
  final String name;
  final List<String> description;
  final String? repository;
  final int index;

  const ProjectCard({
    super.key,
    required this.name,
    required this.description,
    this.repository,
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
            name,
            style: AppTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          ...description.map((desc) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.arrow_right,
                      color: AppTheme.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        desc,
                        style: AppTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              )),
          if (repository != null) ...[
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () async {
                final Uri url = Uri.parse('https://$repository');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              icon: const Icon(Icons.code),
              label: const Text('View Code'),
              style: AppTheme.primaryButtonStyle,
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