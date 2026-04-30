import 'package:exercicio1ao8/model/item.dart';
import 'package:exercicio1ao8/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});
  @override
  State<StoreScreen> createState() => _StoreScreen();
}

final List<Item> itens = [
  Item(nome: "Arroz", preco: 25.90),
  Item(nome: "Feijão", preco: 8.50),
  Item(nome: "Macarrão", preco: 5.00),
  Item(nome: "Leite", preco: 4.50),
  Item(nome: "Café", preco: 12.00),
];

class _StoreScreen extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Itens")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itens.length,
              itemBuilder: (context, index) {
                final itemAtual = itens[index];
                return ListTile(
                  title: Text(itemAtual.nome),
                  subtitle: Text("R\$ ${itemAtual.preco.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<CartProvider>().addItem(itemAtual);
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
