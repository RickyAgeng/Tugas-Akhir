// import 'package:flutter/material.dart';

//
import 'package:presensismk/screens/httptest.dart';
import 'package:presensismk/screens/login_screen.dart';
import 'dart:io'; // Perlu ditambahkan untuk menggunakan File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? _imageFile; // Menggunakan XFile daripada PickedFile
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Utama",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[700],
      ),
      backgroundColor: Colors.green[100],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Ricky Ageng S",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              accountEmail: Text("adminpresensi@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fshanibacreative.com%2Fbagaimana-cara-membuat-foto-profil-yang-bagus%2F&psig=AOvVaw2EOLWpeFv2Jhhz_6uJ_OGL&ust=1712521759598000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjHm-y2roUDFQAAAAAdAAAAABAE"),
              ),
              decoration: BoxDecoration(color: Colors.green[700]),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profil"),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("History Presensi"),
            ),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text("Ubah Password"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Tentang"),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Keluar"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10), // Tambahkan jarak antara AppBar dan body
            Text(
              'Biodata',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(height: 20), // Tambahkan jarak antara Biodata dan GestureDetector
            GestureDetector(
              onTap: () async {
                final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  _imageFile = pickedFile;
                });
              },
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.green, // Warna outline
                    width: 4.0, // Ketebalan outline
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: _imageFile == null
                        ? AssetImage('assets/default_avatar.png') // Default image
                        : FileImage(File(_imageFile!.path)) as ImageProvider,
                  ),
                ),
                child: _imageFile == null
                    ? Center(
                  child: Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.white,
                  ),
                )
                    : null,
              ),
            ),
            Text(
              'Ricky Ageng Saputra',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(height: 20), // Tambahkan jarak antara gambar dan info
            _buildInfoRow('NISN', '1234567890'),
            _buildInfoRow('Kelas', 'XII'),
            _buildInfoRow('Email', 'RickyAgeng.smkmuhtbn@gmail.com'),
            _buildInfoRow('Jurusan', 'Nautika Kapal Penangkap Ikan'),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0), // Beri padding bawah agar tidak terlalu ke bawah
              child: ElevatedButton.icon(
                onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => VerificationPage()),
                );
              },
                icon: Icon(Icons.camera_alt),
                label: Text('Presensi'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Tambahkan jarak pada kiri dan kanan
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$label : ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.left, // Rata kiri
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.right, // Rata kanan
            ),
          ),
        ],
      ),
    );
  }
}





// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key); // Add Key to the constructor
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Menu Utama",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.green[700],
//       ),
//       backgroundColor: Colors.green[100],
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text(
//                 "Ricky Ageng S",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
//               ),
//               accountEmail: Text("adminpresensi@gmail.com"),
//               currentAccountPicture: CircleAvatar(
//                 backgroundImage: NetworkImage(
//                     "https://www.google.com/url?sa=i&url=https%3A%2F%2Fshanibacreative.com%2Fbagaimana-cara-membuat-foto-profil-yang-bagus%2F&psig=AOvVaw2EOLWpeFv2Jhhz_6uJ_OGL&ust=1712521759598000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPjHm-y2roUDFQAAAAAdAAAAABAE"),
//               ),
//               decoration: BoxDecoration(color: Colors.green[700]),
//             ),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text("Profil"),
//             ),
//             ListTile(
//               leading: Icon(Icons.vpn_key),
//               title: Text("Ubah Password"),
//             ),
//             ListTile(
//               leading: Icon(Icons.info),
//               title: Text("Tentang"),
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text("Keluar"),
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginScreen()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(30.0),
//         child: GridView.count(
//           crossAxisCount: 2,
//           children: <Widget>[
//             MyMenu(
//               title: "Kelas",
//               icon: Icons.person,
//               warna: Colors.brown,
//             ),
//             MyMenu(
//               title: "Presensi",
//               icon: Icons.camera_alt,
//               warna: Colors.blue,
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => VerificationPage()),
//                 );
//               }, // Define onTap parameter
//             ), // Add closing bracket
//             MyMenu(
//               title: "Izin",
//               icon: Icons.info,
//               warna: Colors.orange,
//             ),
//             MyMenu(
//               title: "Riwayat",
//               icon: Icons.history,
//               warna: Colors.red,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MyMenu extends StatelessWidget {
//   MyMenu({required this.title, required this.icon, required this.warna, this.onTap}); // Define onTap parameter
//
//   final String title;
//   final IconData icon;
//   final MaterialColor warna;
//   final VoidCallback? onTap; // Declare onTap
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: onTap, // Use onTap callback
//         splashColor: Colors.green,
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Icon(
//                 icon,
//                 size: 70.0,
//                 color: warna,
//               ),
//               Text(title, style: TextStyle(fontSize: 17.0))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// // Future _pickImageFromCamera() async {
//   //   final returnImage =
//   //   await ImagePicker().pickImage(source: ImageSource.camera);
//   //   if (returnImage == null) return;
//   //   setState(() {
//   //     selectedImage = File(returnImage.path);
//   //     _image = File(returnImage.path).readAsBytesSync();
//   //   });
//   //   Navigator.of(context).pop();
//   // }
//
//
// }
//
// // import 'dart:convert';
// //
// // import 'package:flutter/material.dart';
// // import 'package:presensismk/function.dart';
// //
// // class HomeSceeen extends StatefulWidget {
// //   const HomeSceeen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<HomeSceeen> createState() => _HomeSceeenState();
// // }
// //
// // class _HomeSceeenState extends State<HomeSceeen> {
// //   String url = '';
// //   var data;
// //   String output = 'Initial Output';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Simple Flask App')),
// //       body: Center(
// //         child: Container(
// //           padding: EdgeInsets.all(20),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               TextField(
// //                 onChanged: (value) {
// //                   url = 'http://10.0.2.2:5000/api?query=' + value.toString();
// //                 },
// //               ),
// //               TextButton(
// //                 onPressed: () async {
// //                   data = await fetchdata(url);
// //                   var decoded = jsonDecode(data);
// //                   setState(() {
// //                     output = decoded['output'];
// //                   });
// //                 },
// //                 child:
// //                     Text('Fetch ASCII Value', style: TextStyle(fontSize: 20)),
// //               ),
// //               Text(output, style: TextStyle(fontSize: 40, color: Colors.green)),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
