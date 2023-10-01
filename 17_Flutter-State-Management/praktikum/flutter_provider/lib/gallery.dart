import 'package:flutter/material.dart';
import 'main.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Ubah sesuai dengan jumlah kolom yang diinginkan
        ),
        itemCount: yourImageList.length, // Gantilah dengan jumlah gambar yang Anda miliki
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showBottomSheet(context, yourImageList[index]);
            },
            child: Image.asset(
              yourImageList[index], 
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String image) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: 300,
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                    _showBottomSheet(context, yourImageList[1]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(selectedImage: image), 
                      ),
                    );
                  },
                  child: Text('Ya'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text('Tidak'),
                ),
              ],
            ),
          ],
        );
      },
    ).then((value) {
      if (value == true) {
        Navigator.pop(context, image);
      }
    });
  }
}

List<String> yourImageList = [
  'assets/images/paspoto.png',
  'assets/images/paspotojas.png',
  'assets/images/PasPotoo.png',
];
