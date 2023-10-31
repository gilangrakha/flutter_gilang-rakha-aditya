
import 'package:ecommerce_shop/pages/main_home_page.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_shop/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginRegisterPage(),
    );
  }
}

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'myapp_database.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY,
            username TEXT,
            password TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  Future<void> insertUser(String username, String password) async {
    final db = await database;
    await db.insert('users', {'username': username, 'password': password});
  }

  Future<bool> loginUser(String username, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }
}

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLoginPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(isLoginPage ? ' ' : ' '), centerTitle: true, titleTextStyle: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 25,
          color: Colors.deepPurple
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login.png'), scale: 2, alignment: Alignment.topCenter
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 140,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.amber)
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (isLoginPage) {
                            _login(context); // Pass the context here.
                          } else {
                            // Handle registration
                            _register();
                          }
                        }
                      },
                      child: Text(isLoginPage ? 'Login' : 'Register'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLoginPage = !isLoginPage;
                        });
                      },
                      child: Text(isLoginPage ? 'Create an Account' : 'Already have an Account?'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

void _login(BuildContext context) async {
  final username = _usernameController.text;
  final password = _passwordController.text;
  final authenticated = await databaseHelper.loginUser(username, password);

  if (authenticated) {
    // Set the username using the provider
    context.read<UsernameProvider>().setUsername(username);

    // Navigate to the home page upon successful login.
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => MainHomePage(),
    ));
  } else {
    print('Login Failed');
  }
}

  void _register() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Check if the username is already taken (you should add this logic).
    // If the username is available, register the user.
    await databaseHelper.insertUser(username, password);

    // Navigate to the home page or perform other actions upon successful registration.
    // Replace this line with your navigation logic.
    print('Registration Successful');
  }
}
