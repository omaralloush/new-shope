import 'package:flutter/material.dart';
void showSnackBar(BuildContext context, String messege) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      messege,
      style: const TextStyle(fontSize: 16),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: const Color.fromARGB(120, 124, 124, 124),
    shape: null,
    elevation: 0,
  ));
}
