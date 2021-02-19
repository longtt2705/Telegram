import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegram/Screens/Welcome/welcome_screen.dart';
import 'package:telegram/constant.dart';

var assets = <String>[
  "assets/images/chatting.svg",
  "assets/images/connect1.svg",
  "assets/images/connect2.svg",
  "assets/icons/blob1.svg",
  "assets/icons/blob2.svg",
  "assets/icons/blob3.svg",
  "assets/icons/waves1.svg"
];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var precacheFutures = assets.map((path) => precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, path), null));
  await Future.wait(precacheFutures);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram',
      theme: ThemeData(
          primaryColor: primaryColor, scaffoldBackgroundColor: Colors.white),
      home: WelcomeScreen(),
    );
  }
}
