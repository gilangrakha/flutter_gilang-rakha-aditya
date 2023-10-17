import 'package:flutter/material.dart';
import 'home_page.dart';
import 'gallery.dart';
import 'contact_manager.dart';

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
        '/contact': (context) => HomePage(),
        '/gallery': (context) => GalleryPage(),
        '/contact_manager':(context) => ContactManager(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String? selectedImage;

  HomeScreen({this.selectedImage});

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
              title: Text('Contact'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              title: Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(context, '/gallery');
              },
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text('Contact Manager'),
              onTap: () {
                Navigator.pushNamed(context, '/contact_manager');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: selectedImage != null
            ? Image.asset(
                selectedImage!,
                fit: BoxFit.cover,
              )
            : Text('No image selected'),
      ),
    );
  }
}

