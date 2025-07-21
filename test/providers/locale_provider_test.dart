// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../presentation/viewmodels/locale_viewmodel.dart';

// // Create a Mock class for SharedPreferences
// class MockSharedPreferences extends Mock implements SharedPreferences {}

// void main() {
//   group('LocaleViewModel Tests', () {
//     late MockSharedPreferences mockSharedPreferences;
//     late LocaleViewModel localeViewModel;

//     setUp(() async {
//       mockSharedPreferences = MockSharedPreferences();
//       // Set up default return values for SharedPreferences methods if needed
//       when(mockSharedPreferences.getString('app_locale')).thenReturn(null);
//       when(mockSharedPreferences.getString('app_locale_country')).thenReturn(null);
//       localeViewModel = LocaleViewModel(mockSharedPreferences);
//     });

//     test('Initial locale is null if nothing is saved', () {
//       expect(localeViewModel.currentLocale, isNull);
//     });

//     test('Load saved locale on initialization', () async {
//       // Set up SharedPreferences to return a saved locale
//       when(mockSharedPreferences.getString('app_locale')).thenReturn('en');
//       when(mockSharedPreferences.getString('app_locale_country')).thenReturn('US');

//       // Create a new instance of LocaleViewModel to trigger load
//       final viewModel = LocaleViewModel(mockSharedPreferences);
//       // Wait for the loading to complete (it's async)
//       await Future.delayed(Duration.zero);

//       expect(viewModel.currentLocale, const Locale('en', 'US'));
//     });

//     test('Change locale updates currentLocale and notifies listeners', () async {
//       const newLocale = Locale('ar');
//       bool listenerCalled = false;
//       localeViewModel.addListener(() {
//         listenerCalled = true;
//       });

//       await localeViewModel.changeLocale(newLocale);

//       expect(localeViewModel.currentLocale, newLocale);
//       expect(listenerCalled, isTrue);
//       verify(mockSharedPreferences.setString('app_locale', 'ar')).called(1);
//       verify(mockSharedPreferences.remove('app_locale_country')).called(1); // No country code
//     });

//     test('Change locale with country code', () async {
//       const newLocale = Locale('en', 'GB');

//       await localeViewModel.changeLocale(newLocale);

//       expect(localeViewModel.currentLocale, newLocale);
//       verify(mockSharedPreferences.setString('app_locale', 'en')).called(1);
//       verify(mockSharedPreferences.setString('app_locale_country', 'GB')).called(1);
//     });

//     test('changeLocale does not notify if locale is the same', () async {
//       const initialLocale = Locale('fr', 'FR');
//       localeViewModel._currentLocale = initialLocale;
//       bool listenerCalled = false;
//       localeViewModel.addListener(() {
//         listenerCalled = true;
//       });

//       await localeViewModel.changeLocale(initialLocale);

//       expect(listenerCalled, isFalse);
//       verifyNever(mockSharedPreferences.setString('app_locale', any));
//       verifyNever(mockSharedPreferences.setString('app_locale_country', any));
//       verifyNever(mockSharedPreferences.remove('app_locale_country'));
//     });

//     test('Load saved locale with only language code', () async {
//       when(mockSharedPreferences.getString('app_locale')).thenReturn('fr');
//       when(mockSharedPreferences.getString('app_locale_country')).thenReturn(null);

//       final viewModel = LocaleViewModel(mockSharedPreferences);
//       await Future.delayed(Duration.zero);

//       expect(viewModel.currentLocale, const Locale('fr'));
//     });
//   });
// }