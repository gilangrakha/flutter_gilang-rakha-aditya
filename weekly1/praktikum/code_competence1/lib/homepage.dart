import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  _showSubmittedData() {
    final username = usernameController.text;
    final email = emailController.text;
    final message = messageController.text;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Form Submitted'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Username: $username'),
              Text('Email: $email'),
              Text('Message: $message'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BYU Apps'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          // Welcome Section
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset('assets/logo.png'), // Ganti dengan path gambar sesuai kebutuhan
                SizedBox(height: 20),
                Text(
                  'Selamat datang di Aplikasi Kami',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'BYU with you, always be with you.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          // Contact Us Section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 370,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange,
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(labelText: 'Message'),
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _showSubmittedData();
                    },
                    child: Text(
                      'Submit',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
