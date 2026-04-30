import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roteiro6/screen/add_task_screen.dart';
import '../providers/task_providers.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProviders>();
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas')),
      body: ListView.builder(
        itemCount: provider.task.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(provider.task[index]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
