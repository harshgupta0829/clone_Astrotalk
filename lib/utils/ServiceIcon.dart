import 'package:flutter/material.dart';

class ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const ServiceIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.12; // Responsive icon size

    return Column(
      children: [
        Container(
          width: iconSize * 1.5, // Make container slightly larger than icon
          height: iconSize * 1.5,
          decoration: BoxDecoration(
            color: Colors.yellow[400],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(icon, size: iconSize, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
