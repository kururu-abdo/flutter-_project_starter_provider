import 'package:flutter/material.dart';
import 'package:flutter_template_provider/repositories/user_repository.dart';
import '../../domain/entities/user.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;
  List<User> _users = [];
  List<User> get users => _users;

  UserViewModel({required UserRepository userRepo}) : _userRepository = userRepo;

  Future<void> fetchUsers() async {
    _users = await _userRepository.getUsers();
    notifyListeners();
  }
}