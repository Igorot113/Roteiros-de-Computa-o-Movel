import 'package:exercicio1ao8/model/item.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Item> _carrinho = [];
  List<Item> get item => _carrinho;
  int get totalItens => _carrinho.length;

  void addItem(Item item) {
    _carrinho.add(item);
    notifyListeners();
  }

  void removeItem(String nome) {
    _carrinho.removeWhere((item) => item.nome.toLowerCase() == nome.toLowerCase());
    notifyListeners();
  }
  double get totalPrice {
    double total = 0;
    for(var item in _carrinho) {
      total += item.preco;
    }
    return total;
  }
  void limparCarrinho(){
    _carrinho.clear();
    notifyListeners();
  }
}
