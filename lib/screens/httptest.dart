import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert'; // Impor paket untuk 'json'

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  File? _image; // Deklarasikan sebagai nullable
  bool _isLoading = false; // Tambahkan variabel _isLoading

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> verifyImage() async {
    if (_image == null) {
      print('Please take a selfie.');
      return;
    }

    setState(() {
      _isLoading = true; // Set _isLoading ke true saat mulai mengirim gambar
    });

    try {
      print("1");
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(_image!.path, filename: _image!.path.split('/').last)
      });

      print(_image!.path);
      print("2");
      final url = 'http://192.168.100.90:5000/upload';
      final response = await Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 12000),
          receiveTimeout: Duration(seconds: 12000),
          sendTimeout: Duration(seconds: 12000),
        ),
      ).post(url, data: formData);
      print("3");

      if (response.statusCode == 200) {
        String verified = response.data['verification_result'];
        print('Verification Result: $verified');
      } else {
        print('Failed to verify image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _isLoading = false; // Set _isLoading ke false setelah selesai mengirim gambar
      });
    }
  }

  // Future<void> verifyImage() async {
  //   if (_image == null) {
  //     print('Please take a selfie.');
  //     return;
  //   }
  //
  //   try{
  //     final url = 'http://192.168.100.90:5000/upload';
  //     var request = http.MultipartRequest('POST', Uri.parse(url));
  //     request.files.add(await http.MultipartFile.fromPath(
  //         'image', _image!.path)); // Beri tanda seru (!) karena _image dapat null
  //
  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);
  //
  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(
  //           response.body); // Gunakan json.decode untuk mengurai respon JSON
  //       bool verified = responseData['verified'];
  //       print('Verification Result: $verified');
  //     } else {
  //       print('Failed to verify image. Status code: ${response.statusCode}');
  //     }
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Presensi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator() // Tampilkan CircularProgressIndicator saat _isLoading true
            : _image == null
            ? Text('No image taken.')
            : Image.file(_image!), // Beri tanda seru (!) karena _image dapat null
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Take a selfie',
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => verifyImage(),
            tooltip: 'Verify Image',
            child: Icon(Icons.check),
          ),
        ],
      ),
    );
  }
}



// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:convert'; // Impor paket untuk 'json'
//
// class VerificationPage extends StatefulWidget {
//   @override
//   _VerificationPageState createState() => _VerificationPageState();
// }
//
// class _VerificationPageState extends State<VerificationPage> {
//   File? _image; // Deklarasikan sebagai nullable
//
//   Future<void> getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.camera);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future<void> verifyImage() async {
//     if (_image == null) {
//       print('Please take a selfie.');
//       return;
//     }
//
//     try{
//       print("1");
//       FormData formData = FormData.fromMap({
//         'file' : await MultipartFile.fromFile(_image!.path, filename: _image!.path.split('/').last)
//       });
//
//       print(_image!.path);
//       print("2");
//       final url = 'http://192.168.100.90:5000/upload';
//       final response = await Dio(
//         BaseOptions(
//           connectTimeout: Duration(seconds: 12000),
//           receiveTimeout: Duration(seconds: 12000),
//           sendTimeout: Duration(seconds: 12000)
//         )
//       ).post(url, data: formData);
//       print("3");
//
//       if (response.statusCode == 200) {
//         String verified = response.data['verification_result'];
//         print('Verification Result: $verified');
//       } else {
//         print('Failed to verify image. Status code: ${response.statusCode}');
//       }
//     }catch(e){
//       print(e.toString());
//     }
//   }
//
//   // Future<void> verifyImage() async {
//   //   if (_image == null) {
//   //     print('Please take a selfie.');
//   //     return;
//   //   }
//   //
//   //   try{
//   //     final url = 'http://192.168.100.90:5000/upload';
//   //     var request = http.MultipartRequest('POST', Uri.parse(url));
//   //     request.files.add(await http.MultipartFile.fromPath(
//   //         'image', _image!.path)); // Beri tanda seru (!) karena _image dapat null
//   //
//   //     var streamedResponse = await request.send();
//   //     var response = await http.Response.fromStream(streamedResponse);
//   //
//   //     if (response.statusCode == 200) {
//   //       final responseData = json.decode(
//   //           response.body); // Gunakan json.decode untuk mengurai respon JSON
//   //       bool verified = responseData['verified'];
//   //       print('Verification Result: $verified');
//   //     } else {
//   //       print('Failed to verify image. Status code: ${response.statusCode}');
//   //     }
//   //   }catch(e){
//   //     print(e.toString());
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Presensi',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.green[700],
//       ),
//       body: Center(
//         child: _image == null
//             ? Text('No image taken.')
//             : Image.file(
//                 _image!), // Beri tanda seru (!) karena _image dapat null
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: getImage,
//             tooltip: 'Take a selfie',
//             child: Icon(Icons.camera_alt),
//           ),
//           SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: () => verifyImage(),
//             tooltip: 'Verify Image',
//             child: Icon(Icons.check),
//           ),
//         ],
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:convert'; // Impor paket untuk 'json'
//
// class VerificationPage extends StatefulWidget {
//   @override
//   _VerificationPageState createState() => _VerificationPageState();
// }
//
// class _VerificationPageState extends State<VerificationPage> {
//   File? _image; // Deklarasikan sebagai nullable
//
//   Future<void> getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.camera);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future<void> verifyImage() async {
//     if (_image == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please take a selfie.')),
//       );
//       return;
//     }
//
//     try {
//       final url = 'http://192.168.100.90:5000/upload';
//       var request = http.MultipartRequest('POST', Uri.parse(url));
//       request.files.add(await http.MultipartFile.fromPath(
//           'image', _image!.path)); // Beri tanda seru (!) karena _image dapat null
//
//       var streamedResponse = await request.send();
//       var response = await http.Response.fromStream(streamedResponse);
//
//       if (response.statusCode == 200) {
//         final responseData = json.decode(
//             response.body); // Gunakan json.decode untuk mengurai respon JSON
//         bool verified = responseData['verified'];
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Verification Result: $verified')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to verify image. Status code: ${response.statusCode}')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Presensi',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.green[700],
//       ),
//       body: Center(
//         child: _image == null
//             ? Text('No image taken.')
//             : Image.file(
//             _image!), // Beri tanda seru (!) karena _image dapat null
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: getImage,
//             tooltip: 'Take a selfie',
//             child: Icon(Icons.camera_alt),
//           ),
//           SizedBox(height: 10),
//           FloatingActionButton(
//             onPressed: verifyImage,
//             tooltip: 'Verify Image',
//             child: Icon(Icons.check),
//           ),
//         ],
//       ),
//     );
//   }
// }
