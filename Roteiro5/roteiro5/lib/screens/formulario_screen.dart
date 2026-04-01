import 'package:flutter/material.dart';
import 'package:roteiro5/services/storage_service.dart';

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({super.key});

  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final StorageService storage = StorageService();

  List<String> nome = [];
  List<String> email = [];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final nomes = await storage.loadTasks2("key_nome");
    final emails = await storage.loadTasks2("key_email");

    setState(() {
      if (nomes.isNotEmpty) nomeController.text = nomes.first;
      if (emails.isNotEmpty) emailController.text = emails.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: "Nome",
                border: UnderlineInputBorder(),
              ),
              onChanged: (value) async {
                await storage.saveTasks2("key_nome", [value]);
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: UnderlineInputBorder(),
              ),
              onChanged: (value) async {
                await storage.saveTasks2("key_email", [value]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
