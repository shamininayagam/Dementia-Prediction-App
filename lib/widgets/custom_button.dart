import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final IconData? icon;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = Colors.purple,  // Default button color
    this.icon,                  // Optional icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      icon: Icon(icon ?? Icons.check),  // If no icon is provided, use check
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
