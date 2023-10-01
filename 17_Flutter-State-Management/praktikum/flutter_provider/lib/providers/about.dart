import 'package:advance_userinput/model.dart';
import 'package:flutter/material.dart';

class About with ChangeNotifier{
  final List<GetKnow> _about = [];
  List<GetKnow> get about => _about;

  void add(GetKnow about) {
    _about.add(about);
    notifyListeners();
  }

}