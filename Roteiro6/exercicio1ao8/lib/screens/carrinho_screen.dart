import 'package:exercicio1ao8/model/item.dart';
import 'package:exercicio1ao8/providers/cart_provider.dart';
import 'package:exercicio1ao8/screens/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrinhoScreen extends StatefulWidget {
  const CarrinhoScreen({super.key});
  @override
  State<CarrinhoScreen> createState() => _CarrinhoScreen();
}

class _CarrinhoScreen extends State<CarrinhoScreen> {
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerPreco = TextEditingController();
  final TextEditingController controllerDel = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text("Carrinho")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Ir para a Tela da Loja: "),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StoreScreen(),
                      ),
                    );
                  },
                  child: const Text("Store Screen"),
                ),
              ],
            ),
            Text("Adicionar no carrinho", style: TextStyle(fontSize: 30)),
            TextField(
              controller: controllerNome,
              decoration: const InputDecoration(
                labelText: "Digite o nome do produto",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: controllerPreco,
              decoration: const InputDecoration(
                labelText: "Digite o preço do produto",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (controllerNome.text.isNotEmpty &&
                    controllerPreco.text.isNotEmpty) {
                  double? precoConvertido = double.tryParse(
                    controllerPreco.text,
                  );
                  Item item = Item(
                    nome: controllerNome.text,
                    preco: precoConvertido ?? 0.0,
                  );
                  context.read<CartProvider>().addItem(item);
                }
              },
              child: const Text("Salvar item no carrinho"),
            ),
            const SizedBox(height: 20),
            Text("Remover do carrinho", style: TextStyle(fontSize: 30)),
            TextField(
              controller: controllerDel,
              decoration: const InputDecoration(
                labelText: "Digite o nome do produto",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (controllerDel.text.isNotEmpty) {
                  String nomeProduto = controllerDel.text;
                  context.read<CartProvider>().removeItem(nomeProduto);
                }
              },
              child: const Text("Remover item do carrinho"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Carrinho:", style: TextStyle(fontSize: 50)),
                SizedBox(width: 10),
                Text(
                  "Total de Itens: " + provider.totalItens.toString() + " | ",
                  style: TextStyle(fontSize: 50),
                ),
                SizedBox(width: 10),
                Text(
                  "Preço total: " + provider.totalPrice.toString(),
                  style: TextStyle(fontSize: 50),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartProvider>().limparCarrinho();
                  },
                  child: Text("Limpar carrinho"),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: provider.item.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(provider.item[index].nome),
                    subtitle: Text(provider.item[index].preco.toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
