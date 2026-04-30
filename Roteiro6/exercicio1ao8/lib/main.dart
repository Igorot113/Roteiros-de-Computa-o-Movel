import 'package:exercicio1ao8/providers/cart_provider.dart';
import 'package:exercicio1ao8/screens/carrinho_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MaterialApp(home: CarrinhoScreen()),
    );
  }
}
