import 'package:exercicio4ao8/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});
  final List<String> produtosLista = const [
    "Arroz",
    "Feijão",
    "Macarrão",
    "Leite",
    "Café",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista")),
      body: ListView.builder(
        itemCount: produtosLista.length,
        itemBuilder: (context, index) {
          return ProductTile(nome: produtosLista[index]);
        },
      ),
    );
  }
}
/*
children: const [
          ListTile(title: Text("Arroz")),
          ListTile(title: Text("Feijão")),
          ListTile(title: Text("Macarrão")),
          ListTile(title: Text("Leite")),
          ListTile(title: Text("Café")),
        ],
*/ 
