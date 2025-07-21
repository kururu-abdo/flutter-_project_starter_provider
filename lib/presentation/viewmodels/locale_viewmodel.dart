// presentation/viewmodels/locale_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleViewModel extends ChangeNotifier {
  Locale? _currentLocale;
  Locale? get currentLocale => _currentLocale;

  final SharedPreferences _prefs;
  static const String _localeKey = 'app_locale';

  LocaleViewModel(this._prefs) {
    _loadSavedLocale();
  }

  Future<void> changeLocale(Locale newLocale) async {
    if (_currentLocale != newLocale) {
      _currentLocale = newLocale;
      notifyListeners();
      await _saveLocale(newLocale);
    }
  }

  Future<void> _saveLocale(Locale locale) async {
    await _prefs.setString(_localeKey, locale.languageCode);
    if (locale.countryCode != null) {
      await _prefs.setString('$_localeKey\_country', locale.countryCode!);
    } else {
      await _prefs.remove('$_localeKey\_country');
    }
  }

  Future<void> _loadSavedLocale() async {
    final languageCode = _prefs.getString(_localeKey);
    final countryCode = _prefs.getString('$_localeKey\_country');

    if (languageCode != null) {
      _currentLocale = Locale(languageCode, countryCode);
      notifyListeners();
    }
  }
}