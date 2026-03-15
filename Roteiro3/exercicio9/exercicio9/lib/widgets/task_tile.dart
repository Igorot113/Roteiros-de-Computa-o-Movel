import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String nome;
  const Task({super.key, required this.nome});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nome),
    );
  }
}
