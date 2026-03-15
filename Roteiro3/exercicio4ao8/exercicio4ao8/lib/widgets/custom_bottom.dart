import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final Color cor;
  const CustomBottom({
    super.key,
    required this.texto,
    required this.onPressed,
    this.cor = Colors.deepPurpleAccent,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: cor,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      ),
      child: Text(texto, style: const TextStyle(fontSize: 12, color: Colors.white)),
    );
  }
}
