import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_application/screens/home_screen.dart';
import 'package:music_application/themes/dark_mode.dart';
import 'package:music_application/themes/light_mode.dart';
import 'package:music_application/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import 'models/playlist_provider.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>ThemeProvider()),
    ChangeNotifierProvider(create: (context)=>PlaylistProvider()),
  ],
    child: MyApp(),
  )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: HomeScreen(),
       theme: Provider.of<ThemeProvider>(context).themeData,

    );
  }
}
