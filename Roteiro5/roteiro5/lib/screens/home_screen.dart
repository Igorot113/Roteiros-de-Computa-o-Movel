import 'package:flutter/material.dart';
import 'package:roteiro5/screens/formulario_screen.dart';
import 'package:roteiro5/screens/lista_carrinho_screen.dart';
import '../services/storage_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  final StorageService storage = StorageService();
  double opacidade = 0;

  List<String> tasks = [];
  List<String> pagina = ["Selecione uma pagina"];

  @override
  void initState() {
    super.initState();
    loadTasks();
    if (tasks.isEmpty) {
      opacidade = 1;
    } else {
      opacidade = 0;
    }
  }

  Future<void> loadTasks() async {
    final loadedTasks = await storage.loadTasks();
    setState(() {
      tasks = loadedTasks;
      pagina = loadedTasks;
    });
  }

  Future<void> addTask() async {
    if (controller.text.isEmpty) return;
    setState(() {
      tasks.add(controller.text);
      controller.clear();
      opacidade = 0;
    });
    await storage.saveTasks(tasks);
  }

  Future<void> removeTask(int index) async {
    setState(() {
      tasks.removeAt(index);
      if (tasks.isEmpty) {
        opacidade = 1;
      }
    });
    await storage.saveTasks(tasks);
  }

  Future<void> removeAll() async {
    setState(() {
      tasks.clear();
      opacidade = 1;
    });
  }

  Future<void> paginaA() async {
    setState(() {
      pagina = ["Pagina A"];
    });
    await storage.saveTasks(pagina);
  }

  Future<void> paginaB() async {
    setState(() {
      pagina = ["Pagina B"];
    });
    await storage.saveTasks(pagina);
  }

  Future<void> paginaC() async {
    setState(() {
      pagina = ["Pagina C"];
    });
    await storage.saveTasks(pagina);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(pagina.isNotEmpty ? pagina.first : "Nenhuma página"),
            AnimatedOpacity(
              opacity: opacidade,
              duration: Duration(microseconds: 1),
              child: const Text("Lista Vazia"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Nova tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addTask,
                  child: const Text('Adicionar'),
                ),
                const SizedBox(height: 20, width: 10),
                ElevatedButton(
                  onPressed: removeAll,
                  child: const Text('Remover tudo'),
                ),
                const SizedBox(height: 20, width: 10),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListaCarrinhoScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_left_sharp),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: paginaA,
                  child: const Text('Pagina A'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: paginaB,
                  child: const Text('Pagina B'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: paginaC,
                  child: const Text('Pagina C'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FormularioScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_right_alt_sharp),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => removeTask(index),
                    ),
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
