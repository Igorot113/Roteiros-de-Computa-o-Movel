import 'package:exercicio9/widgets/task_tile.dart';
import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  const Lista({super.key});
  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final List<String> tarefas = [];
  final TextEditingController _controller = TextEditingController();
  void adicionarTarefa() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        tarefas.add(_controller.text);
      });
      _controller.clear();
    }
  }

  void removerTarefa(String tarefa) {
    if (tarefa.isNotEmpty) {
      setState(() {
        tarefas.remove(tarefa);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Tarefas")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: "Nova Tarefa"),
                  ),
                ),
                ElevatedButton(
                  onPressed: adicionarTarefa,
                  child: const Text("Adicionar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    removerTarefa(_controller.text);
                  },
                  child: const Text("Remover"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return Task(nome: tarefas[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
