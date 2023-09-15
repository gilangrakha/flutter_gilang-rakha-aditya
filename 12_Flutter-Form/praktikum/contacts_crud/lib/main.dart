import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ContactManager(),
  ));
}

class Contact {
  String name;
  String phoneNumber;

  Contact(this.name, this.phoneNumber);
}

class ContactManager extends StatefulWidget {
  @override
  _ContactManagerState createState() => _ContactManagerState();
}

class _ContactManagerState extends State<ContactManager> {
  final List<Contact> contacts = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Icon(
                  Icons.phone_android,
                  size: 20.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Create New Contact',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  height: 70,
                  width: 330,
                  child: Align(
                    child: Text(
                      'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. '
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    )
                  ),
                )
              ],
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Insert your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Nomor',
                hintText: '+62...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                onPressed: () {
                  if (selectedIndex == -1) {
                    addContact();
                  } else {
                    updateContact(selectedIndex);
                  }
                },
                  child: Text(selectedIndex == -1 ? 'Submit' : 'Edit'),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Text(
              'List Contacts',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 35,
                      color: Color.alphaBlend(Colors.deepPurple, Colors.deepPurple),
                    ),
                    title: Text(contacts[index].name),
                    subtitle: Text(contacts[index].phoneNumber),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            editContact(index);
                          },
                        ),
                        SizedBox(width: 8.0),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteContact(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addContact() {
    setState(() {
      contacts.add(Contact(nameController.text, phoneNumberController.text));
      nameController.clear();
      phoneNumberController.clear();
    });
  }

  void editContact(int index) {
    setState(() {
      nameController.text = contacts[index].name;
      phoneNumberController.text = contacts[index].phoneNumber;
      selectedIndex = index;
    });
  }

  void updateContact(int index) {
    setState(() {
      contacts[index].name = nameController.text;
      contacts[index].phoneNumber = phoneNumberController.text;
      nameController.clear();
      phoneNumberController.clear();
      selectedIndex = -1;
    });
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
      if (selectedIndex == index) {
        selectedIndex = -1;
      }
    });
  }
}
