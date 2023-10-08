import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PutRequestPage extends StatefulWidget {
  @override
  _PutRequestPageState createState() => _PutRequestPageState();
}

class _PutRequestPageState extends State<PutRequestPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();

  Future<void> _sendPutRequest() async {
    final dio = Dio();
    final url = 'https://jsonplaceholder.typicode.com/posts/1';

    final data = {
      'id': int.parse(idController.text),
      'title': titleController.text,
      'body': bodyController.text,
      'userId': int.parse(userIdController.text),
    };

    try {
      final response = await dio.put(
        url,
        data: data,
      );

      if (response.statusCode == 200) {
        // PUT request successful
        final responseBody = response.data;
        final updatedPost = Post.fromJson(responseBody);

        // Show a dialog with the updated post details
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('PUT Request Successful'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${updatedPost.id}'),
                  Text('Title: ${updatedPost.title}'),
                  Text('Body: ${updatedPost.body}'),
                  Text('UserID: ${updatedPost.userId}'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        throw Exception('Failed to update post');
      }
      debugPrint(response.data.toString());
    } catch (error) {
      // Handle errors
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to update post: $error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
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
        title: Text('PUT Request Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            TextField(
              controller: userIdController,
              decoration: InputDecoration(labelText: 'UserID'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _sendPutRequest,
              child: Text('Update Post'),
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  final int id;
  final String title;
  final String body;
  final int userId;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }
}
