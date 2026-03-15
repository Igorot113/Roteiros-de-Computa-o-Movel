import 'package:exercicio4ao8/screens/home_screen.dart';
import 'package:exercicio4ao8/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: CustomBottom(
          texto: "Ir para Home Page",
          onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
        }),
      ),
    );
  }
}