import 'package:flutter/material.dart';
import 'package:presensismk/screens/home_screen.dart';
import 'package:presensismk/screens/login_screen.dart';
import 'package:presensismk/screens/httptest2.dart';
import 'package:presensismk/screens/rekap_absensi.dart';
import 'package:presensismk/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage()
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:presensismk/screens/home_screen.dart';
//
// void main()=>runApp(new MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({ Key? key }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home : HomeSceeen(),
//     );
//   }
// }
