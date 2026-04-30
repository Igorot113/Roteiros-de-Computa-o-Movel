import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roteiro6/providers/task_providers.dart';
import 'package:roteiro6/screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProviders(),
      child: const MaterialApp(home: MainScreen()),
    );
  }
}
