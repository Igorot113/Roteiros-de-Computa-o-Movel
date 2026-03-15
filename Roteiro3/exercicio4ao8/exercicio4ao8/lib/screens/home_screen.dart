import 'package:exercicio4ao8/screens/product_screen.dart';
import 'package:exercicio4ao8/screens/profile_screen.dart';
import 'package:exercicio4ao8/widgets/custom_bottom.dart';
import 'package:exercicio4ao8/widgets/list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBottom(
              texto: "Ir para Profile",
              cor: Colors.green,
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
            CustomBottom(
              texto: "Ir para Product",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            CustomBottom(
              texto: "Ir para Lista",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
