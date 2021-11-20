import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_clone/screens/root_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));
  runApp(const MaterialApp(
    title: "Instagram",
    debugShowCheckedModeBanner: false,
    home: RootApp(),
  ));
}
