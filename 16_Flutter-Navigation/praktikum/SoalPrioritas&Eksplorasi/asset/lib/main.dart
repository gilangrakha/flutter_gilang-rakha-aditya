import 'package:flutter/material.dart';
import './gallery.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asset Flutter'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final selectedImage = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GalleryPage(),
              ),
            );

            if (selectedImage != null) {
              // Gambar yang dipilih ditampilkan kembali di halaman utama
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Image.asset(
                      selectedImage,
                      fit: BoxFit.cover,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Tutup'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Text('Buka Galeri'),
        ),
      ),
      drawer: DrawerButtonIcon(),
    );
  }
}
