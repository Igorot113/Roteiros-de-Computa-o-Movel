import 'dart:developer';

import 'package:exemplo_completo/msmlifecycle_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela Inicial")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LifeCycleScreen(),
                  ),
                );
              },
              child: const Text("Abrir tela de ciclo de vida"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MsmLifeCycleScreen(),
              ),
              );
            }, child: Text("Tela do Exercicio"),
            ),
          ],
        ),
      ),
    );
  }
}

class LifeCycleScreen extends StatefulWidget {
  const LifeCycleScreen({super.key});
  @override
  State<LifeCycleScreen> createState() => _LifeCycleScreenState();
}

class _LifeCycleScreenState extends State<LifeCycleScreen> {
  int contador = 0;
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    log("initState: tela iniciada");
    controller.text = "Texto inicial";
  }

  @override
  void dispose() {
    log("dispose: tela finalizada");
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("build: interface reconstruída");
    return Scaffold(
      appBar: AppBar(title: const Text("Ciclo de Vida")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contador: $contador", style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Digite algo",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  contador++;
                });
              },
              child: const Text("Incrementar"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Fechar tela"),
            ),
          ],
        ),
      ),
    );
  }
}
