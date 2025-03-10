# Mahmudul Hasan - Portfolio Website

A modern, responsive portfolio website built with Flutter Web. This portfolio showcases skills, projects, experience, and education in a beautiful and interactive way.

## Features

- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices
- **Beautiful UI**: Modern design with animations and transitions
- **SEO Optimized**: Includes meta tags for better search engine visibility
- **Interactive Elements**: Animated sections and interactive components
- **Dynamic Content**: Loads data from a JSON file for easy updates
- **PWA Support**: Can be installed as a Progressive Web App

## Technologies Used

- Flutter Web
- Dart
- Responsive Framework
- Flutter Animate
- Google Fonts
- URL Launcher
- Font Awesome Flutter
- Flutter Staggered Grid View

## Getting Started

### Prerequisites

- Flutter SDK (version 3.6.1 or higher)
- Dart SDK (version 3.6.1 or higher)
- Chrome browser (for development)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/portfolio.git
   ```

2. Navigate to the project directory:
   ```
   cd portfolio
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Run the app in development mode:
   ```
   flutter run -d chrome
   ```

### Deployment

To build the app for production:

```
flutter build web --release
```

The built files will be in the `build/web` directory. You can deploy these files to any web hosting service.

## Customization

### Updating Content

The portfolio content is loaded from `assets/cv.json`. You can update this file to change the content of the portfolio.

### Changing Theme

The theme colors and styles can be modified in `lib/themes/app_theme.dart`.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework
- All the package authors for their contributions
- [Mahmudul Hasan](https://github.com/mh-dpi) for the CV data

## Contact

For any inquiries, please contact [honey.app.developer@gmail.com](mailto:honey.app.developer@gmail.com).
