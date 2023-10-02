import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'gallery.dart';
import 'contact_manager.dart';
import './providers/about.dart' as about_provider;
import 'loginpage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<about_provider.About>(
          create: (_) => about_provider.About(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      home: LoginPage(),
      routes: {
        '/home':(context) => HomeScreen(),
        '/contact': (context) => HomePage(),
        '/gallery': (context) => GalleryPage(),
        '/contact_manager':(context) => ContactManager(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  final String? selectedImage;

  HomeScreen({this.selectedImage});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences logindata;
  String username = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial()async{
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username').toString();
    });
  }
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
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
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
          Text(username),
          ElevatedButton(
            onPressed: () {
              logindata.setBool('login', true);
              logindata.remove('username');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage()
                ),
              );
            }, 
            child: const Text('Log Out'),
          ),
          Center(
            child: widget.selectedImage != null
                ? Image.asset(
                    widget.selectedImage!,
                    fit: BoxFit.cover,
                  )
                : Text('No image selected'),
          ),
        ],
      ),
    );
  }
}

