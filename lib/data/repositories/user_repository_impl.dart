

import 'package:flutter_template_provider/data/datasources/local/user_local_data_source.dart';
import 'package:flutter_template_provider/data/datasources/remote/user_remote_data_source.dart';
import 'package:flutter_template_provider/domain/entities/user.dart';
import 'package:flutter_template_provider/repositories/user_repository.dart';

import '../models/user_model.dart'; // Assuming you have data transfer objects

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<User>> getUsers() async {
    try {
      final List<UserModel> remoteUsers = await remoteDataSource.getUsers();
      // Optionally save to local data source
      return remoteUsers.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Handle error, maybe try fetching from local data source
      final List<UserModel> localUsers = await localDataSource.getUsers();
      return localUsers.map((model) => model.toEntity()).toList();
    }
  }

  @override
  Future<User> getUser(int id) async {
    try {
      final UserModel? remoteUser = await remoteDataSource.getUser(id);
      return remoteUser?.toEntity() ?? User(id: -1, name: 'Not Found', email: '');
    } catch (e) {
      final UserModel? localUser = await localDataSource.getUser(id);
      return localUser?.toEntity() ?? User(id: -1, name: 'Not Found', email: '');
    }
  }
}