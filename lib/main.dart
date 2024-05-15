import 'package:flutter/material.dart';
import 'package:flutter_app_device_info_smaple/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      title: 'Material App',
      home: HomePage(),
    );
  }
}
