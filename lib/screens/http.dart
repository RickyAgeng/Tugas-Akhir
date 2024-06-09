import 'dart:io'; // Mengimpor dart:io untuk kelas File
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http; // Mengimpor paket http untuk permintaan HTTP
import 'package:image_picker/image_picker.dart'; // Mengimpor paket image_picker

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  File? _file;

  // Membuat fungsi unggah
  // Mengonversi file gambar menjadi base64 encoded
  // http.put

  void UploadImage() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _file = File(myfile!.path);
    });
  }

  Future uploadImage () async {
    if(_file == null ) return;

    
    Map<String, String> requestHeaders = {'Content-type' : 'application/json',
      'Accept' : 'application/json'};
    var response = await http.put(Uri.parse("http://10.0.2.2:5000/api"), body:base64, headers:requestHeaders);

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _file != null
                  ? Image.file(_file!)
                  : Text('Tidak ada gambar yang dipilih'), // Menampilkan gambar yang dipilih jika ada
              Spacer(),
              Text("data"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => UploadImage(), // Memanggil fungsi unggah
                    child: Text("Upload"),
                  ),
                  TextButton(
                    onPressed: () => uploadImage(), // Memanggil fungsi uploadImage
                    child: Text("Prediksi"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
