

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class UiDarkModeController with ChangeNotifier {
  final _storage = GetStorage();

  int selectedLanguageIndex = 0;

  final List<String> title = [
    'Madina',
    'Amiri Quran',
    'Kitab Regular (Tajweed)',
    'Naskh Quran',
  ];

  // Return font family name exactly as in pubspec.yaml
  String getFontFamilyByIndex(int index) {
    switch (index) {
      case 0:
        return 'MADDINA';
      case 1:
        return 'Amiri Quran Regular';
      case 2:
        return 'Kitab-Regular';
      case 3:
        return 'Deco Type';
      default:
        return 'MADDINA'; // Default font
    }
  }
// Inside UiDarkModeController
//=============================//




  String _selectedReadingType = 'Juz Style'; // Default value

// Getter
  String get selectedReadingType => _selectedReadingType;

// Load from storage
  Future<void> _loadSelectedReadingType() async {
    _selectedReadingType = _storage.read('selectedReadingType') ?? 'Juz Style';
  }

// Save to storage
  Future<void> saveSelectedReadingType(String type) async {
    _selectedReadingType = type;
    await _storage.write('selectedReadingType', type);
    notifyListeners();
  }



//=======================
  // Font size and slider values
  double _fontSize = 16.0;
  String _fontFamily = 'MADDINA'; // Default font family
  List<double> _sliderValues = [0.5, 0.5, 0.5];

  // Theme management
  bool _isDarkMode = false;
  Color _appColor = Colors.white;
  String _theme = 'starfield';
  String _currentRoute = '/home';

  UiDarkModeController() {
    loadAllPreferences();
  }

  // Getters
  double get fontSize => _fontSize;
  String get fontFamily => _fontFamily;
  List<double> get sliderValues => _sliderValues;
  bool get isDarkMode => _isDarkMode;
  Color get appColor => _appColor;
  String get theme => _theme;
  String get currentRoute => _currentRoute;

  // Initialize all saved values
  Future<void> loadAllPreferences() async {
    await GetStorage.init();
    await _loadFontSize();
    await _loadFontFamily();
    await _loadSliderValues();
    notifyListeners();
  }

  // Font family methods
  Future<void> _loadFontFamily() async {
    _fontFamily = _storage.read('fontFamily') ?? 'MADDINA';
  }

  Future<void> saveFontFamily(String family) async {
    _fontFamily = family;
    await _storage.write('fontFamily', family);
    notifyListeners();
  }

  // Font size methods
  Future<void> _loadFontSize() async {
    _fontSize = _storage.read('fontSize') ?? 16.0;
  }

  Future<void> saveFontSize(double size) async {
    _fontSize = size;
    await _storage.write('fontSize', size);
    notifyListeners();
  }

  // Slider methods
  Future<void> _loadSliderValues() async {
    final savedValues = _storage.read('sliderValues');
    if (savedValues != null && savedValues is String) {
      _sliderValues = savedValues.split(',')
          .map((e) => double.tryParse(e) ?? 0.5)
          .toList();
    }
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
    _storage.write('isDarkMode', value);
    notifyListeners();
  }

  void changeColor(Color color) {
    _appColor = color;
    _storage.write('appColor', color.value);
    notifyListeners();
  }

  void changeTheme(String theme) {
    _theme = theme;
    _storage.write('theme', theme);
    notifyListeners();
  }

  void changeRoute(String route) {
    _currentRoute = route;
    notifyListeners();
  }
}
