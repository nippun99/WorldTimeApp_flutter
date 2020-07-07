import 'package:flutter/material.dart';
import 'package:world_time/screens/choose_loc.dart';
import 'package:world_time/screens/home.dart';
import 'package:world_time/screens/loading.dart';
 
void main() => runApp(WorldApp());
 
class WorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/home',
      routes: {
        '/': (context)=>Loading(),
        '/home':(context)=>Home(),
        '/location':(context)=>ChooseLoc() 
      },
      );
  }
}