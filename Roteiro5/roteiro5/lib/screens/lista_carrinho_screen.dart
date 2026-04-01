import 'package:flutter/material.dart';
import 'package:roteiro5/services/storage2_service.dart';

class ListaCarrinhoScreen extends StatefulWidget {
  const ListaCarrinhoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ListaCarrinhoState();
}

class _ListaCarrinhoState extends State<StatefulWidget> {
  final Storage2Service storage = Storage2Service();

  final List<String> produto = ["Produto A", "Produto B", "Produto C"];
  List<String> carrinho = [];

  @override
  void initState() {
    super.initState();
    _inicializarCarrinho();
  }

  Future<void> _inicializarCarrinho() async {
    final dadosSalvos = await storage.carregarCarrinho();
    setState(() {
      carrinho = dadosSalvos;
    });
  }

  Future<void> _adicionarAoCarrinho(String nomeProduto) async {
    setState(() {
      carrinho.add(nomeProduto);
    });
    await storage.salvarCarrinho(carrinho);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carrinho Simples")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Produtos Disponíveis",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: produto.map((produto) {
              return ListTile(
                title: Text(produto),
                trailing: ElevatedButton(
                  onPressed: () => _adicionarAoCarrinho(produto),
                  child: const Text("Adicionar"),
                ),
              );
            }).toList(),
          ),
          const Divider(height: 40, thickness: 2),
          const Text(
            "Itens no Carrinho",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: carrinho.isEmpty
                ? const Center(child: Text("Carrinho vazio"))
                : ListView.builder(
                    itemCount: carrinho.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.shopping_cart),
                        title: Text(carrinho[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
