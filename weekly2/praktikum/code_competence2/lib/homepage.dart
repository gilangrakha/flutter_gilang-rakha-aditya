import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  bool isSidebarOpen = false;

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Row(
        children: [
          if (isSidebarOpen)
            Container(
              width: 200,
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Contact Us'),
                    onTap: () {
                      // Handle navigation to Contact Us
                    },
                  ),
                  ListTile(
                    title: Text('About Us'),
                    onTap: () {
                      // Handle navigation to About Us
                    },
                  ),
                  ListTile(
                    title: Text('Login'),
                    onTap: () {
                      // Handle navigation to Login
                    },
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: toggleSidebar,
                      ),
                      Text('Your App'),
                      SizedBox(width: 40),
                    ],
                  ),
                ),
                // About Us Section
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      // List of Programs/Services/Products in Cards
                      Card(
                        child: ListTile(
                          title: Text('Program 1'),
                          subtitle: Text('Description of Program 1'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Program 2'),
                          subtitle: Text('Description of Program 2'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Program 3'),
                          subtitle: Text('Description of Program 3'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
