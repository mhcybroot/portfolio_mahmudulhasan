import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../models/cv_model.dart';
import '../../themes/app_theme.dart';
import '../../widgets/project_card.dart';
import '../../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  final CV cv;

  const ProjectsSection({super.key, required this.cv});

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
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SectionTitle(title: 'Projects'),
          const SizedBox(height: 24),
          if (isDesktop)
            SizedBox(
              height: screenSize.height * 0.6,
              child: MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                itemCount: cv.projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    name: cv.projects[index].name,
                    description: cv.projects[index].description,
                    repository: cv.projects[index].repository,
                    index: index,
                  );
                },
              ),
            )
          else if (isTablet)
            SizedBox(
              height: screenSize.height * 0.6,
              child: MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                itemCount: cv.projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    name: cv.projects[index].name,
                    description: cv.projects[index].description,
                    repository: cv.projects[index].repository,
                    index: index,
                  );
                },
              ),
            )
          else
            SizedBox(
              height: screenSize.height * 0.6,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cv.projects.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: ProjectCard(
                      name: cv.projects[index].name,
                      description: cv.projects[index].description,
                      repository: cv.projects[index].repository,
                      index: index,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
} 