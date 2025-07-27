// import 'package:flutter/material.dart';
// import 'package:omermjamal/assets_helper/app_colors.dart';
// import 'package:omermjamal/helpers/navigation_service.dart';
// import 'package:provider/provider.dart';
// import 'ui_dark_mood_controller.dart';
//
//
// class UiDarkModeHelper {
//   static const List<Color> availableColors = [
//     Colors.blue,
//     Colors.red,
//     Colors.green,
//     Colors.purple,
//     Colors.orange,
//     Colors.teal,
//     Colors.amber,
//     Colors.cyan,
//     Colors.indigo,
//   ];
//
//   // static const List<Map<String, String>> availableRoutes = [
//   //   {'name': 'Home Screen', 'route': '/home'},
//   //   {'name': 'Profile Screen', 'route': '/profile'},
//   //   {'name': 'Dashboard Screen', 'route': '/dashboard'},
//   //   {'name': 'Settings Screen', 'route': '/settings'},
//   //   {'name': 'Explore Screen', 'route': '/explore'},
//   // ];
//
//   static void setColor(BuildContext context, Color color) {
//     Provider.of<UiDarkMoodController>(context, listen: false).changeColor(color);
//   }
//
//   static Color getCurrentColor(BuildContext context) {
//     return Provider.of<UiDarkMoodController>(context, listen: false).isDarkMode
//         ? AppColors.c2F2F2F
//         : Provider.of<UiDarkMoodController>(context, listen: false).appColor;
//   }
//
//   static void navigateToScreen(BuildContext context, String route) {
//     Provider.of<UiDarkMoodController>(context, listen: false).changeRoute(route);
//     NavigationService.navigateTo(route);
//   }
//
//   static Color getRandomColor() {
//     return availableColors[DateTime.now().millisecond % availableColors.length];
//   }
//
//   static void setDarkMode(BuildContext context, bool value) {
//     Provider.of<UiDarkMoodController>(context, listen: false).setDarkMode(value);
//     if (!value) {
//       Provider.of<UiDarkMoodController>(context, listen: false)
//           .changeColor(getRandomColor());
//     }
//   }
//
//   static bool isDarkMode(BuildContext context) {
//     return Provider.of<UiDarkMoodController>(context, listen: false).isDarkMode;
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/assets_helper/app_colors.dart';
import 'package:quran_app/helpers/navigation_service.dart';
import 'package:quran_app/helpers/ui_dark_mood_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UiDarkModeHelper {
  // Define theme modes
  static const String starfieldTheme = 'starfield';
  static const String darkTheme = 'dark';
  static const String lightTheme = 'light';

  // Available colors for non-Starfield themes (optional, can be customized)
  static const List<Color> availableColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.amber,
    Colors.cyan,
    Colors.indigo,
  ];

  // Save theme preference
  static Future<void> _saveThemePreference(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }




  // Load theme preference
  static Future<String> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('theme') ?? starfieldTheme; // Default to Starfield
  }

  // Initialize theme based on saved preference
  static Future<void> initTheme(BuildContext context) async {
    final theme = await _loadThemePreference();
    final controller = Provider.of<UiDarkModeController>(context, listen: false);
    if (theme == darkTheme) {
      controller.setDarkMode(true);
      controller.changeTheme(darkTheme);
    } else if (theme == lightTheme) {
      controller.setDarkMode(false);
      controller.changeTheme(lightTheme);
    } else {
      controller.setDarkMode(false); // Default for Starfield
      controller.changeTheme(starfieldTheme);
    }
  }

  // Set theme (Starfield, Dark, or Light)
  static void setTheme(BuildContext context, String theme) {
    final controller = Provider.of<UiDarkModeController>(context, listen: false);
    if (theme == starfieldTheme) {
      controller.setDarkMode(false); // Starfield uses system/light theme
      controller.changeTheme(starfieldTheme);
      controller.changeColor(Colors.transparent); // No solid color for Starfield
    } else if (theme == darkTheme) {
      controller.setDarkMode(true);
      controller.changeTheme(darkTheme);
      controller.changeColor(AppColors.c2F2F2F); // Dark mode color
    } else if (theme == lightTheme) {
      controller.setDarkMode(false);
      controller.changeTheme(lightTheme);
      controller.changeColor(Colors.white); // Light mode color
    }
    _saveThemePreference(theme); // Persist the theme
  }

  // Get current theme
  static String getCurrentTheme(BuildContext context) {
    return Provider.of<UiDarkModeController>(context, listen: false).theme;
  }

  static Gradient getCurrentGradient(BuildContext context) {
    final controller = Provider.of<UiDarkModeController>(context, listen: false);

    if (controller.theme == starfieldTheme) {
      return const LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
      );
    }

    return controller.isDarkMode
        ? const LinearGradient(
      colors: [Color(0xFF111926), Color(0xFF376385)],
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
    )
        : const LinearGradient(
      colors: [Colors.white, Colors.white],
    );
  }


  // Check if dark mode is active
  static bool isDarkMode(BuildContext context) {
    return Provider.of<UiDarkModeController>(context, listen: false).isDarkMode;
  }

  // Navigation helper
  static void navigateToScreen(BuildContext context, String route) {
    Provider.of<UiDarkModeController>(context, listen: false).changeRoute(route);
    NavigationService.navigateTo(route);
  }

  static bool isStarfieldMode(BuildContext context) {

    final currentTheme = getCurrentTheme(context);
    return currentTheme == starfieldTheme;
  }

  // Check if isLightMode is active
  static bool isLightMode(BuildContext context) {
    final currentTheme = getCurrentTheme(context);
    return currentTheme == lightTheme;
  }
}