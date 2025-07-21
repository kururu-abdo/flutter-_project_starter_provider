// data/datasources/local/user_local_datasource.dart
import '../../models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserLocalDataSource {
  final SharedPreferences _prefs;

  UserLocalDataSource(this._prefs);

  Future<List<UserModel>> getUsers() async {
    final usersString = _prefs.getStringList('users') ?? [];
    return usersString.map((json) => UserModel.fromJson(jsonDecode(json))).toList();
  }

  Future<UserModel?> getUser(int id) async {
    final usersString = _prefs.getStringList('users') ?? [];
    final userString = usersString.firstWhere((json) => UserModel.fromJson(jsonDecode(json)).id == id, orElse: () => '');
    return userString.isNotEmpty ? UserModel.fromJson(jsonDecode(userString)) : null;
  }

  Future<void> saveUsers(List<UserModel> users) async {
    final usersStringList = users.map((user) => jsonEncode(user.toJson())).toList();
    await _prefs.setStringList('users', usersStringList);
  }
}