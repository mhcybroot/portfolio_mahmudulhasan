import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool centered;

  const SectionTitle({
    super.key,
    required this.title,
    this.centered = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment:
            centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.headlineMedium,
            textAlign: centered ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 8),
          Container(
            width: centered ? 80 : 60,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
} 