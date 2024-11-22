import 'package:flutter/material.dart';

class LoginTextfield extends StatelessWidget {
  const LoginTextfield({
    required this.label,
    required this.controller,
    this.obscureText = false,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 1,
              color: Colors.green
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              width: 1,
              color: Colors.green
            )
          )
        ),
      ),
    );
  }
}