import 'package:flutter/material.dart';
import 'package:rest_api/dicebear.dart';
import './postdio.dart';
import './deserialization.dart';
import './putdio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advance User Input',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/home':(context) => HomeScreen(),
        '/api': (context) => PostContactPage(),
        '/json': (context) => DeserializePage(),
        '/apiput': (context) => PutRequestPage(),
        '/dicebear': (context) => DiceBearImagePage(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text('RestAPI'),
              onTap: () {
                Navigator.pushNamed(context, '/api');
              },
            ),
            ListTile(
              title: Text('Deserialize'),
              onTap: () {
                Navigator.pushNamed(context, '/json');
              },
            ),
            ListTile(
              title: Text('PUT Dio'),
              onTap: () {
                Navigator.pushNamed(context, '/apiput');
              },
            ),
            ListTile(
              title: Text('Dicebear'),
              onTap: () {
                Navigator.pushNamed(context, '/dicebear');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Text('Selamat Datang'),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
