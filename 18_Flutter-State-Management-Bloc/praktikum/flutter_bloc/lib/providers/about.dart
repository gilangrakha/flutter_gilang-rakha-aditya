import 'package:flutter/material.dart';
import 'package:flutter_bloc/model.dart';

class About with ChangeNotifier{
  final List<GetKnow> _about = [];
  List<GetKnow> get about => _about;

  void add(GetKnow about) {
    _about.add(about);
    notifyListeners();
  }

}