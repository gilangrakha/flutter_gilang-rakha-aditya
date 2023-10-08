import 'package:flutter/material.dart';
import 'package:mvvm_flutter/model/api/contact_api.dart';
import 'package:mvvm_flutter/model/contact_model.dart';

class ContactViewModel with ChangeNotifier{
  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  getAllContacts() async{
    final c = await ContactAPI.getContacts();
    _contacts = c;
    notifyListeners();
  }
}