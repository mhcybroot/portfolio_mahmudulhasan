import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/cv_model.dart';
import '../../themes/app_theme.dart';
import '../../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  final CV cv;

  const ContactSection({super.key, required this.cv});

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
          const SectionTitle(title: 'Get In Touch'),
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
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Information',
                        style: AppTheme.headlineSmall,
                      )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .slideY(
                              begin: 0.2,
                              end: 0,
                              duration: 600.ms,
                              curve: Curves.easeOutQuad),
                      const SizedBox(height: 24),
                      _buildContactItem(
                        icon: Icons.email,
                        title: 'Email',
                        value: cv.personalInfo.contact.email,
                        onTap: () async {
                          final Uri url = Uri.parse(
                              'mailto:${cv.personalInfo.contact.email}');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        delay: 200,
                      ),
                      const SizedBox(height: 16),
                      _buildContactItem(
                        icon: Icons.phone,
                        title: 'Phone',
                        value: cv.personalInfo.contact.phone,
                        onTap: () async {
                          final Uri url = Uri.parse(
                              'tel:${cv.personalInfo.contact.phone}');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        delay: 300,
                      ),
                      const SizedBox(height: 16),
                      _buildContactItem(
                        icon: Icons.location_on,
                        title: 'Location',
                        value: cv.personalInfo.contact.location,
                        onTap: () async {
                          final Uri url = Uri.parse(
                              'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(cv.personalInfo.contact.location)}');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        delay: 400,
                      ),
                      const SizedBox(height: 16),
                      _buildContactItem(
                        icon: FontAwesomeIcons.github,
                        title: 'GitHub',
                        value: cv.personalInfo.contact.github,
                        onTap: () async {
                          final Uri url = Uri.parse(
                              'https://${cv.personalInfo.contact.github}');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        delay: 500,
                      ),
                      const SizedBox(height: 16),
                      _buildContactItem(
                        icon: FontAwesomeIcons.linkedin,
                        title: 'LinkedIn',
                        value: cv.personalInfo.contact.linkedin,
                        onTap: () async {
                          final Uri url = Uri.parse(
                              'https://${cv.personalInfo.contact.linkedin}');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        delay: 600,
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    decoration: AppTheme.cardDecoration,
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Send a Message',
                          style: AppTheme.headlineSmall,
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Subject',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: 'Message',
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // In a real app, this would send the message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Message functionality not implemented in this demo'),
                                ),
                              );
                            },
                            style: AppTheme.primaryButtonStyle,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: Text('Send Message'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 300.ms)
                      .slideY(
                          begin: 0.2,
                          end: 0,
                          duration: 600.ms,
                          delay: 300.ms,
                          curve: Curves.easeOutQuad),
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          const Divider(),
          const SizedBox(height: 24),
          Text(
            '© ${DateTime.now().year} ${cv.personalInfo.name}. All Rights Reserved.',
            style: AppTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Made with Flutter Web',
            style: AppTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
    required int delay,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: AppTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: delay.ms)
        .slideX(
            begin: -0.2,
            end: 0,
            duration: 600.ms,
            delay: delay.ms,
            curve: Curves.easeOutQuad);
  }
} 