import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
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
              yourImageList[index], // Gantilah dengan lokasi gambar yang sesuai
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
              height: 300, // Sesuaikan tinggi gambar sesuai keinginan
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true); // Pilih 'Ya'
                  },
                  child: Text('Ya'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false); // Pilih 'Tidak'
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
        // Navigasi kembali ke halaman utama dengan membawa gambar yang dipilih
        Navigator.pop(context, image);
      }
    });
  }
}

// Di sini, yourImageList adalah list berisi lokasi gambar-gambar Anda.
List<String> yourImageList = [
  'assets/images/paspoto.png',
  'assets/images/paspotojas.png',
  'assets/image3.jpg',
  // Tambahkan gambar-gambar Anda ke dalam list ini
];
