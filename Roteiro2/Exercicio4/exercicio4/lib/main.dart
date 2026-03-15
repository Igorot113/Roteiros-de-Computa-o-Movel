// Importa a biblioteca principal de componentes visuais do Flutter (Material Design)
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Tela1());
  }
}

class Tela1 extends StatefulWidget {
  const Tela1({super.key});
  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  String mensagem = "Valor  atual: 0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela 1")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mensagem, style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Escolher número"),
              onPressed: () async {
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Tela2()),
                );
                if (resultado != null) {
                  // setState informa ao Flutter que o estado mudou
                  setState(() {
                    // Atualiza a mensagem com o valor recebido
                    mensagem = "Valor recebido: $resultado";
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Tela2 extends StatelessWidget {
  const Tela2({super.key});
  @override
  Widget build(BuildContext context) {
    String textoDigitado = "";
    return Scaffold(
      appBar: AppBar(title: const Text("Tela 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Digite um número:"),
              onChanged: (valor) {
                textoDigitado = valor;
              },
            ),
            ElevatedButton(
              child: const Text("Enviar"),
              onPressed: () {
                Navigator.pop(context, textoDigitado);
              },
            ),
          ],
        ),
      ),
    );
  }
}
