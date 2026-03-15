import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista Simples")),
      body: ListView(
        children: const [
          ListTile(title: Text("Arroz")),
          ListTile(title: Text("Feijão")),
          ListTile(title: Text("Macarrão")),
          ListTile(title: Text("Leite")),
        ],
      ),
    );
  }
}
