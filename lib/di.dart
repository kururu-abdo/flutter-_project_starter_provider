// di/providers.dart
import 'package:dio/dio.dart';
import 'package:flutter_template_provider/data/datasources/local/user_local_data_source.dart';
import 'package:flutter_template_provider/data/datasources/remote/user_remote_data_source.dart';
import 'package:flutter_template_provider/data/repositories/user_repository_impl.dart';
import 'package:flutter_template_provider/presentation/user_viewmodel.dart';
import 'package:flutter_template_provider/presentation/viewmodels/locale_viewmodel.dart';
import 'package:flutter_template_provider/repositories/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
 // Assuming you have a viewmodel

Future<List<Provider>> setupProviders() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = Dio(); // Configure Dio if needed

  final userRemoteDataSource = UserRemoteDataSource(dio);
  final userLocalDataSource = UserLocalDataSource(sharedPreferences);
  final userRepository = UserRepositoryImpl(remoteDataSource: userRemoteDataSource, localDataSource: userLocalDataSource);
  // final getUsersUseCase = GetUsers(userRepository);
  final userViewModel = UserViewModel(userRepo: userRepository);
  final localeViewModel = LocaleViewModel(sharedPreferences);

  return [
    Provider<Dio>.value(value: dio),
    Provider<SharedPreferences>.value(value: sharedPreferences),
    Provider<UserRemoteDataSource>.value(value: userRemoteDataSource),
    Provider<UserLocalDataSource>.value(value: userLocalDataSource),

    //repos
    Provider<UserRepository>.value(value: userRepository),
    // Provider<GetUsers>.value(value: getUsersUseCase),

    //provider
    Provider.value(value: userViewModel,), 
    Provider<LocaleViewModel>.value(value: localeViewModel)
    // Add other providers for your use cases, view models, etc.
  ];
}