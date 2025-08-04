import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final bool ispassword;
  final String hintText;
  final Widget? suffixIcon; // The '?' makes it optional (nullable)
  final TextInputType keyboardType;

  // The constructor: This is the function that "builds" an instance of our widget
  const TextFieldInput({
    super.key,
    required this.controller,
    required this.ispassword,
    required this.hintText,
    this.suffixIcon, // Not required, can be null
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    // This defines the invisible border style required by the task
    const borderStyle = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent, // Transparent border
        style: BorderStyle.none, // No line style
      ),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );

    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: const Color.fromARGB(218, 226, 37, 24), // Custom red cursor
      decoration: InputDecoration(
        hintText: hintText,
        border: borderStyle,
        focusedBorder: borderStyle,
        enabledBorder: borderStyle,
        filled: true, // This is crucial for showing a background color
        contentPadding: const EdgeInsets.all(8),
        suffixIcon: suffixIcon,
      ),
      textInputAction: TextInputAction.next,
      obscureText: ispassword,
    );
  }
}
