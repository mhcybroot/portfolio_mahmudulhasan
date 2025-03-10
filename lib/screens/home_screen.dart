import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../models/cv_model.dart';
import '../themes/app_theme.dart';
import '../widgets/section_title.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/education_section.dart';
import 'sections/contact_section.dart';

class HomeScreen extends StatefulWidget {
  final CV cv;

  const HomeScreen({super.key, required this.cv});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentSection = 0;
  final List<String> _sections = [
    'Home',
    'About',
    'Experience',
    'Skills',
    'Projects',
    'Education',
    'Contact'
  ];

  void _scrollToSection(int index) {
    final double screenHeight = MediaQuery.of(context).size.height;
    _scrollController.animateTo(
      index * screenHeight,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: HeroSection(cv: widget.cv),
              ),
              SliverToBoxAdapter(
                child: AboutSection(cv: widget.cv),
              ),
              SliverToBoxAdapter(
                child: ExperienceSection(cv: widget.cv),
              ),
              SliverToBoxAdapter(
                child: SkillsSection(cv: widget.cv),
              ),
              SliverToBoxAdapter(
                child: ProjectsSection(cv: widget.cv),
              ),
              SliverToBoxAdapter(
                child: EducationSection(cv: widget.cv),
              ),
              SliverToBoxAdapter(
                child: ContactSection(cv: widget.cv),
              ),
            ],
          ),
          
          // Navigation bar for desktop
          if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white.withOpacity(0.9),
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      widget.cv.personalInfo.name,
                      style: AppTheme.titleLarge.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const Spacer(),
                    for (int i = 0; i < _sections.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextButton(
                          onPressed: () => _scrollToSection(i),
                          style: TextButton.styleFrom(
                            foregroundColor: _currentSection == i
                                ? AppTheme.primaryColor
                                : AppTheme.textSecondaryColor,
                          ),
                          child: Text(_sections[i]),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          
          // Floating action button for mobile
          if (ResponsiveBreakpoints.of(context).smallerThan(TABLET))
            Positioned(
              bottom: 24,
              right: 24,
              child: FloatingActionButton(
                backgroundColor: AppTheme.primaryColor,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SectionTitle(title: 'Navigation'),
                          for (int i = 0; i < _sections.length; i++)
                            ListTile(
                              title: Text(_sections[i]),
                              leading: Icon(
                                i == 0
                                    ? Icons.home
                                    : i == 1
                                        ? Icons.person
                                        : i == 2
                                            ? Icons.work
                                            : i == 3
                                                ? Icons.code
                                                : i == 4
                                                    ? Icons.folder
                                                    : i == 5
                                                        ? Icons.school
                                                        : Icons.email,
                                color: AppTheme.primaryColor,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                _scrollToSection(i);
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.menu),
              ),
            ),
        ],
      ),
    );
  }
} 