// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';
// import 'dart:convert';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' show join;
//
// List<CameraDescription>? cameras;
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras = await availableCameras();
//   runApp(MaterialApp(
//     home: VerificationPage(),
//   ));
// }
//
// class VerificationPage extends StatefulWidget {
//   @override
//   _VerificationPageState createState() => _VerificationPageState();
// }
//
// class _VerificationPageState extends State<VerificationPage> {
//   CameraController? _controller;
//   Future<void>? _initializeControllerFuture;
//   File? _image;
//
//   @override
//   void initState() {
//     super.initState();
//     if (cameras != null && cameras!.isNotEmpty) {
//       _controller = CameraController(
//         cameras![0],
//         ResolutionPreset.high,
//       );
//       _initializeControllerFuture = _controller!.initialize();
//     } else {
//       print('No camera found');
//     }
//   }
//
//   Future<void> takePicture() async {
//     if (_controller == null || !_controller!.value.isInitialized) {
//       print('Camera not initialized');
//       return;
//     }
//
//     try {
//       await _initializeControllerFuture;
//
//       final path = join(
//         (await getTemporaryDirectory()).path,
//         '${DateTime.now()}.png',
//       );
//
//       XFile picture = await _controller!.takePicture();
//       File image = File(picture.path);
//
//       setState(() {
//         _image = image;
//       });
//
//       print('Picture taken: ${image.path}');
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   Future<void> verifyImage() async {
//     if (_image == null) {
//       print('Please take a selfie.');
//       return;
//     }
//
//     final url = 'http://127.0.0.1:5000/upload'; // Update with your server IP
//     var request = http.MultipartRequest('POST', Uri.parse(url));
//     request.files.add(await http.MultipartFile.fromPath('file', _image!.path));
//
//     var streamedResponse = await request.send();
//     var response = await http.Response.fromStream(streamedResponse);
//
//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       bool verified = responseData['result'];
//       print('Verification Result: $verified');
//       _showVerificationDialog(verified);
//     } else {
//       print('Failed to verify image. Status code: ${response.statusCode}');
//     }
//   }
//
//   void _showVerificationDialog(bool verified) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Verification Result'),
//           content: Text(verified ? 'Verified' : 'Not Verified'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
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
//       body: _controller == null
//           ? Center(child: Text('No camera found'))
//           : FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: CameraPreview(_controller!),
//                 ),
//                 _image == null
//                     ? Text('No image taken.')
//                     : Image.file(_image!),
//               ],
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: takePicture,
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
