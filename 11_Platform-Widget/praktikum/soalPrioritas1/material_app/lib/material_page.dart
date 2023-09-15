import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(title: Text('Home')),
            ListTile(title: Text('Setting')),
          ],
        ),
      ),
      body: ContactList(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;

  Contact(this.name, this.phoneNumber);
}

class ContactList extends StatelessWidget {
  final List<Contact> contacts = [
    Contact('Leanne', '123-456-7890'),
    Contact('Ervin Howell', '123-456-7891'),
    Contact('Clementine Bauch', '123-456-7892'),
    Contact('Patricia Lebsack', '123-456-7893'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(contacts[index].name),
          subtitle: Text(contacts[index].phoneNumber),
          onTap: () {
          },
        );
      },
    );
  }
}