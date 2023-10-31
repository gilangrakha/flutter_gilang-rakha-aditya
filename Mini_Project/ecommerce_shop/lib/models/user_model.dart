import 'package:flutter/material.dart';

class UsernameProvider with ChangeNotifier {
  late String _username;

  String get username => _username;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void clearUserData() {
    _username = '';
    notifyListeners();
  }
}


