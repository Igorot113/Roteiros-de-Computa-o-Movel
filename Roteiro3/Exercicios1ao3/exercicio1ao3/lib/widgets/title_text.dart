import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String titulo;
  const TitleText({super.key, required this.titulo});
  @override
  Widget build(BuildContext context) {
    return Text(titulo, style: const TextStyle(fontSize: 50));
  }
}
