import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:roteiro6/screen/list_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListScreen()),
              );
            },
            child: const Text("Tela List Screnn"),
          ),
        ],
      ),
    );
  }
}
