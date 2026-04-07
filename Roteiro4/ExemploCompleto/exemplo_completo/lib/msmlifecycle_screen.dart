import 'package:flutter/material.dart';

class MsmLifeCycleScreen extends StatefulWidget {
  const MsmLifeCycleScreen({super.key});

  @override
  State<MsmLifeCycleScreen> createState() => _LifeCycleScreenState();
}

class _LifeCycleScreenState extends State<MsmLifeCycleScreen> {
  bool msmVisivel = true;
  double opacidade = 1;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("Tela iniciada");
    controller.text = "";
  }

  @override
  void dispose() {
    print("Tela finalizada");
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Tela reconstruída");
    return Scaffold(
      appBar: AppBar(title: const Text("Mensagem Life Cycler")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacidade,
              duration: const Duration(seconds: 1),
              child: Text(controller.text),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Mensagem",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  controller.value;
                });
              },
              child: const Text("Enviar"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (msmVisivel == true) {
                    msmVisivel = false;
                    opacidade = 0;
                  } else {
                    msmVisivel = true;
                    opacidade = 1;
                  }
                });
              },
              child: const Text("Mudar visibilidade"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Sair da tela"),
            ),
          ],
        ),
      ),
    );
  }
}
