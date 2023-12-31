import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:open_file/open_file.dart';
import 'main.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super (key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.orange;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Widget'),
        centerTitle: true,
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
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
           children: [
            buildDatePicker(context),
            const SizedBox(height: 20.0,),
            buildColorPicker(context),
            const SizedBox(height: 20),
            buildFilePicker(),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context, 
                  initialDate: currentDate, 
                  firstDate: DateTime(1990), 
                  lastDate: DateTime(currentDate.year+5)
                );
                setState(() {
                  if(selectDate != null){
                    _dueDate = selectDate;
                  }
                });
              }, 
              child: const Text('Select'),
            )
          ],
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(_dueDate),
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        const SizedBox(height: 20,),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_currentColor),
            ),
            onPressed: () {
              showDialog(
                context: context, 
                builder: (context){
                  return AlertDialog(
                    title: const Text('Pick Your Color'),
                    content: ColorPicker(
                      pickerColor: _currentColor, onColorChanged: (color){
                        setState(() {
                          _currentColor = color;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        child: const Text('Save'),
                      ),
                    ],
                  );
                }
              );
            }, 
            child: const Text('Pick Color'),
          ),
        ),
      ],
    );
  }

  Widget buildFilePicker(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick Files'),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            child: const Text('Pick and Open Files'),
            onPressed: () {
              _pickFile();
            },
          ),
        )
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    String? filePath = file.path;
    //_openFile(file);

    if (filePath != null) {
    Navigator.push(
      context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(selectedImage: filePath), 
        ),
      );
    }
  }

  void _openFile(PlatformFile file){
      OpenFile.open(file.path);
  }
}