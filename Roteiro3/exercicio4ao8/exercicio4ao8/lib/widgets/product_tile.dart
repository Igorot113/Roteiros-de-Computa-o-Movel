import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String nome;
  const ProductTile({super.key, required this.nome});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.assistant_photo_outlined),
      title: Text(nome),
      subtitle: const Text("Produto com desconto."),
      trailing: const Icon(Icons.arrow_circle_right_outlined),
    );
  }
}
