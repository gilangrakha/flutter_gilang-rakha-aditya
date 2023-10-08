import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Contact {
  final int id;
  final String name;
  final String phone;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}

class DeserializePage extends StatefulWidget {
  @override
  _DeserializePageState createState() => _DeserializePageState();
}

class _DeserializePageState extends State<DeserializePage> {
  Future<Contact?> _fetchContact() async {
    final response = await http.get(
      Uri.parse('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final contact = Contact.fromJson(data);
      print('ID: ${contact.id}');
      print('Name: ${contact.name}');
      print('Phone: ${contact.phone}');

      return contact;
    } else {
      throw Exception('Failed to load contact');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deserialize JSON'),
      ),
      body: Center(
        child: FutureBuilder<Contact?>(
          future: _fetchContact(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No Data');
            } else {
              final contact = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ID: ${contact.id}'),
                  Text('Name: ${contact.name}'),
                  Text('Phone: ${contact.phone}'),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
