import 'package:advance_userinput/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/about.dart' as about_provider;

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var hobiController = TextEditingController();
  String name = '';
  String hobi = '';

  @override
  void dispose() {
    nameController.dispose();
    hobiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final aboutProvider = Provider.of<about_provider.About>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('About You'),
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
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                onChanged: (String value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextField(
                controller: hobiController,
                onChanged: (String value) {
                  setState(() {
                    hobi = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if(!formKey.currentState!.validate()) return;
        
                  formKey.currentState!.save();
        
                  aboutProvider.add(GetKnow(name: name, hobi: hobi));
                },
                child: const Text('Input'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: aboutProvider.about.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(aboutProvider.about[index].name),
                      subtitle: Text(aboutProvider.about[index].hobi),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
