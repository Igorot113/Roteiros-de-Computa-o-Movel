import 'package:exercicio1ao8/screen/detail_screen.dart';
import 'package:exercicio1ao8/screen/profile_screen.dart';
import 'package:exercicio1ao8/widgets/title_text.dart';
import 'package:flutter/material.dart';

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
            TitleText(titulo: "Para onde voce quer ir ?"),
            ElevatedButton(
              child: const Text("Perfil"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Detail"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
