import 'package:flutter/material.dart';
import 'package:new_astroltalk_ui/widgets/MainScreen.dart';

void main() {
  runApp(const AstrotalkApp());
}

class AstrotalkApp extends StatelessWidget {
  const AstrotalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astrotalk UI',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter', // Assuming Inter font, can be changed
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
