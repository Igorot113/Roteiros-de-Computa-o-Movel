import 'package:flutter/material.dart';
import 'package:roteiro3/screens/list_screen2.dart';
import 'detail_screen.dart';
import 'package:roteiro3/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              texto: "Ir para Detalhe",
              cor: Colors.yellow,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailScreen()),
                );
              },
            ),
            SizedBox(height: 20,),
            CustomButton(
              texto: "Ir para lista",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListScreen2()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
