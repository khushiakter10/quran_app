// // import 'package:flutter/material.dart';
// // import 'package:get_storage/get_storage.dart';
// //
// // class UiDarkMoodController extends ChangeNotifier {
// //   Color _appColor = Colors.blue;
// //   String _currentRoute = '/home';
// //   bool _isDarkMode = false;
// //
// //   UiDarkMoodController() {
// //     if (GetStorage().hasData('appColor')) {
// //       _appColor = Color(GetStorage().read('appColor'));
// //     }
// //     if (GetStorage().hasData('isDarkMode')) {
// //       _isDarkMode = GetStorage().read('isDarkMode');
// //     }
// //   }
// //
// //   Color get appColor => _appColor;
// //   String get currentRoute => _currentRoute;
// //   bool get isDarkMode => _isDarkMode;
// //
// //   void changeColor(Color color) {
// //     _appColor = color;
// //     GetStorage().write('appColor', color.value);
// //     notifyListeners();
// //   }
// //
// //   void changeRoute(String route) {
// //     _currentRoute = route;
// //     notifyListeners();
// //   }
// //
// //   void setDarkMode(bool value) {
// //     _isDarkMode = value;
// //     GetStorage().write('isDarkMode', value);
// //     notifyListeners();
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UiDarkModeController with ChangeNotifier {
//
//
//
//
//   double _fontSize = 16.0;
//   List<double> _sliderValues = [0.5, 0.5, 0.5];
//
//   double get fontSize => _fontSize;
//   List<double> get sliderValues => _sliderValues;
//
//   Future<void> loadFontSize() async {
//     final prefs = await SharedPreferences.getInstance();
//     _fontSize = prefs.getDouble('size') ?? 16.0;
//     notifyListeners();
//   }
//
//   Future<void> saveFontSize(double size) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setDouble('size', size);
//   }
//
//   Future<void> loadSliderValues() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedValues = prefs.getString('sliderValues');
//     if (savedValues != null) {
//       _sliderValues = savedValues.split(',').map((e) => double.parse(e)).toList();
//       notifyListeners();
//     }
//   }
//
//   Future<void> saveSliderValues() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('sliderValues', _sliderValues.join(','));
//   }
//
//   void updateAllSliders(double newValue) {
//     _sliderValues = List.filled(_sliderValues.length, newValue);
//     saveSliderValues();
//     notifyListeners();
//   }
//
//   void updateSingleSlider(int index, double newValue) {
//     _sliderValues[index] = newValue;
//     saveSliderValues();
//     notifyListeners();
//   }
//
//
//
//   bool _isDarkMode = false;
//   Color _appColor = Colors.white; // Default color
//   String _theme = 'starfield'; // Default theme
//   String _currentRoute = '/home'; // Default route
//
//   bool get isDarkMode => _isDarkMode;
//   Color get appColor => _appColor;
//   String get theme => _theme;
//   String get currentRoute => _currentRoute;
//
//   void setDarkMode(bool value) {
//     _isDarkMode = value;
//     notifyListeners();
//   }
//
//   void changeColor(Color color) {
//     _appColor = color;
//     notifyListeners();
//   }
//
//   void changeTheme(String theme) {
//     _theme = theme;
//     notifyListeners();
//   }
//
//   void changeRoute(String route) {
//     _currentRoute = route;
//     notifyListeners();
//   }
// }



import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UiDarkModeController with ChangeNotifier {
  final _storage = GetStorage();

  // Font size and slider values
  double _fontSize = 16.0;

  List<double> _sliderValues = [0.5, 0.5, 0.5];

  // Theme management
  bool _isDarkMode = false;
  Color _appColor = Colors.white;
  String _theme = 'starfield';
  String _currentRoute = '/home';

  // Getters
  double get fontSize => _fontSize;
  List<double> get sliderValues => _sliderValues;




  bool get isDarkMode => _isDarkMode;
  Color get appColor => _appColor;
  String get theme => _theme;
  String get currentRoute => _currentRoute;

  // Initialize all saved values
  Future<void> initialize() async {
    await loadFontSize();
    await loadSliderValues();
    notifyListeners();
  }

  // Font size methods
  Future<void> loadFontSize() async {
    _fontSize = _storage.read('fontSize') ?? 16.0;
    notifyListeners();
  }

  Future<void> saveFontSize(double size) async {
    _fontSize = size;
    await _storage.write('fontSize', size);
    notifyListeners();
  }

  // Slider methods
  Future<void> loadSliderValues() async {
    final savedValues = _storage.read('sliderValues');
    if (savedValues != null && savedValues is String) {
      _sliderValues = savedValues.split(',')
          .map((e) => double.tryParse(e) ?? 0.5)
          .toList();
    }
    notifyListeners();
  }

  Future<void> saveSliderValues() async {
    await _storage.write('sliderValues', _sliderValues.join(','));
  }

  Future<void> updateAllSliders(double newValue) async {
    _sliderValues = List.filled(_sliderValues.length, newValue);
    await saveSliderValues();
    notifyListeners();
  }

  Future<void> updateSingleSlider(int index, double newValue) async {
    if (index >= 0 && index < _sliderValues.length) {
      _sliderValues[index] = newValue;
      await saveSliderValues();
      notifyListeners();
    }
  }

  // Theme methods
  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void changeColor(Color color) {
    _appColor = color;
    notifyListeners();
  }

  void changeTheme(String theme) {
    _theme = theme;
    notifyListeners();
  }

  void changeRoute(String route) {
    _currentRoute = route;
    notifyListeners();
  }
}