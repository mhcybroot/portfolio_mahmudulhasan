import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'models/cv_model.dart';
import 'screens/home_screen.dart';
import 'themes/app_theme.dart';
import 'utils/cv_loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahmudul Hasan - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: FutureBuilder<CV>(
        future: CVLoader.loadCV(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error loading CV data: ${snapshot.error}'),
              ),
            );
          } else if (snapshot.hasData) {
            return HomeScreen(cv: snapshot.data!);
          } else {
            return const Scaffold(
              body: Center(
                child: Text('No CV data found'),
              ),
            );
          }
        },
      ),
    );
  }
}
