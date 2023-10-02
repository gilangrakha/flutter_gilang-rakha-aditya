import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';

class Contact {
  String name;
  String phoneNumber;
  DateTime? selectedDate;
  Color selectedColor;
  String? selectedFilePath;

  Contact(
    this.name,
    this.phoneNumber, {
    this.selectedDate,
    this.selectedColor = Colors.orange,
    this.selectedFilePath,
  });
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

  void addContact({
    required String name,
    required String phoneNumber,
    DateTime? selectedDate,
    required Color selectedColor,
    String? selectedFilePath,
  }) {
    setState(() {
      contacts.add(Contact(
        name,
        phoneNumber,
        selectedDate: selectedDate,
        selectedColor: selectedColor,
        selectedFilePath: selectedFilePath,
      ));
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

  void _openSelectionPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectionPage(),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      addContact(
        name: nameController.text,
        phoneNumber: phoneNumberController.text,
        selectedDate: result['date'],
        selectedColor: result['color'],
        selectedFilePath: result['filePath'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
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
            ElevatedButton(
              onPressed: _openSelectionPage,
              child: Text('Select Date, Color, and File'),
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
                      color: Color.alphaBlend(
                        Colors.deepPurple,
                        Colors.deepPurple,
                      ),
                    ),
                    title: Text(contacts[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone: ${contacts[index].phoneNumber}',
                        ),
                        Text(
                          'Date: ${contacts[index].selectedDate != null ? DateFormat('dd-MM-yyyy').format(contacts[index].selectedDate!) : 'Not selected'}',
                        ),
                        Text(
                          'Color: ${contacts[index].selectedColor.toString()}',
                        ),
                        Text(
                          'File: ${contacts[index].selectedFilePath ?? 'Not selected'}',
                        ),
                      ],
                    ),
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
}

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  DateTime? selectedDate;
  Color selectedColor = Colors.orange;
  String? selectedFilePath;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    setState(() {
      selectedFilePath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDatePicker(context),
            SizedBox(height: 20.0),
            buildColorPicker(context),
            SizedBox(height: 20),
            buildFilePicker(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'date': selectedDate,
                  'color': selectedColor,
                  'filePath': selectedFilePath,
                });
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date'),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null
                  ? DateFormat('dd-MM-yyyy').format(selectedDate!)
                  : 'Not selected',
            ),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime.now().add(Duration(days: 365 * 5)),
                );
                if (selectDate != null) {
                  setState(() {
                    selectedDate = selectDate;
                  });
                }
              },
              child: Text('Select'),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color'),
        SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          color: selectedColor,
        ),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(selectedColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Pick Your Color'),
                    content: ColorPicker(
                      pickerColor: selectedColor,
                      onColorChanged: (color) {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Pick Color'),
          ),
        ),
      ],
    );
  }

  Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pick Files'),
        SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: Text('Pick and Open Files'),
          ),
        ),
        if (selectedFilePath != null)
          Text(
            'File: $selectedFilePath',
            style: TextStyle(fontSize: 16),
          ),
      ],
    );
  }
}
