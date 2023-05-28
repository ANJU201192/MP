import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'home.dart';
import 'imageupload.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      //   (
      //   fontFamily: 'Raleway',
      // ),
      home: const ImageUpload(),
      debugShowCheckedModeBanner: false,
    );
  }
}
