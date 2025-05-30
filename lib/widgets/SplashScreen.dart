import 'package:flutter/material.dart';
import 'dart:async';

import 'package:new_astroltalk_ui/widgets/MainScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomePage after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIXUcxhktOdx8rQD-tu9symV4lX7e0n7lYV4ApQSQjnCnIzHzbVLfHyTefGa40baJ4s5M&usqp=CAU',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const CircularProgressIndicator();
          },
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, size: 50, color: Colors.red);
          },
        ),
      ),
    );
  }
}
