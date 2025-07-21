// data/datasources/remote/user_remote_datasource.dart
import 'package:dio/dio.dart';
import '../../models/user_model.dart';

class UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSource(this._dio);

  Future<List<UserModel>> getUsers() async {
    final response = await _dio.get('https://api.example.com/users');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  Future<UserModel?> getUser(int id) async {
    final response = await _dio.get('https://api.example.com/users/$id');
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to fetch user');
    }
  }
}