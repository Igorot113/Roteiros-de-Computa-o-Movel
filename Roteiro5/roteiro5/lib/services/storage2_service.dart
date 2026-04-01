import 'package:shared_preferences/shared_preferences.dart';

class Storage2Service {
  static const String _keyCarrinho = "itens_carrinho";

  Future<void> salvarCarrinho(List<String> itens) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_keyCarrinho, itens);
  }

  Future<List<String>> carregarCarrinho() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyCarrinho) ?? [];
  }
}