import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PostContactPage extends StatefulWidget {
  @override
  _PostContactPageState createState() => _PostContactPageState();
}

class _PostContactPageState extends State<PostContactPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> _postData() async {
    final Dio dio = Dio();
    final Map<String, dynamic> data = {
      'name': nameController.text,
      'phone': phoneController.text,
    };

    try {
      final Response response = await dio.post(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
        data: data,
      );

      if (response.statusCode == 201) {
        // Data berhasil terkirim
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Data has been post successfully.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Gagal mengirim data
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to send data. Please try again.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }

      debugPrint(response.data.toString());

    } catch (error) {
      // Error saat melakukan request
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred. Please try again later.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Contact Data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _postData,
              child: Text('POST'),
            ),
          ],
        ),
      ),
    );
  }
}
