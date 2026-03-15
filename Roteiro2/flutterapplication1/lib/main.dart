// Importa a biblioteca principal de componentes visuais do Flutter (Material Design)
import 'package:flutter/material.dart';

// Função principal - ponto de entrada da aplicação
void main() {
  // Inicia o aplicativo e define qual widget será o raiz da aplicação
  runApp(const MyApp());
}

// MyApp é o widget principal da aplicação
// StatelessWidget porque ele não muda durante execução
class MyApp extends StatelessWidget {
  // Construtor constante (boa prática quando o widget é imutável)
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // MaterialApp configura a aplicação inteira
    return const MaterialApp(
      // Define qual é a primeira tela que será exibida
      home: Tela1(),
    );
  }
}

// Tela1 é Stateful porque ela vai mudar quando receber o valor da Tela2
class Tela1 extends StatefulWidget {
  // Construtor padrão
  const Tela1({super.key});
  @override
  State<Tela1> createState() => _Tela1State();
  // createState cria o objeto que armazenará o estado mutável da tela
}

// Classe privada que guarda o estado da Tela1
class _Tela1State extends State<Tela1> {
  // Variável que será exibida na tela
  // Inicialmente mostra mensagem padrão
  String mensagem = "Nenhum valor recebido";
  @override
  Widget build(BuildContext context) {
    // Scaffold cria a estrutura padrão de uma tela
    return Scaffold(
      // Barra superior da aplicação
      appBar: AppBar(title: const Text("Tela 1")),
      // Corpo principal da tela
      body: Center(
        // Column organiza os elementos verticalmente
        child: Column(
          // Centraliza verticalmente
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Exibe a mensagem atual
            Text(
              mensagem, // Mostra o valor da variável mensagem
              style: const TextStyle(fontSize: 18), // Define tamanho da fonte
            ),
            // Espaçamento vertical entre texto e botão
            const SizedBox(height: 20),
            // Botão que navega para Tela2
            ElevatedButton(
              // Texto do botão
              child: const Text("Ir para Tela 2"),
              // Função executada ao clicar
              onPressed: () async {
                // Navigator.push empilha uma nova tela
                // await faz a execução esperar até a Tela2 ser fechada
                final resultado = await Navigator.push(
                  context, // Contexto atual necessário para navegação
                  MaterialPageRoute(
                    // Define qual tela será aberta
                    builder: (context) => const Tela2(),
                  ),
                );
                // Verifica se algum valor foi retornado
                if (resultado != null) {
                  // setState informa ao Flutter que o estado mudou
                  setState(() {
                    // Atualiza a mensagem com o valor recebido
                    mensagem = "Valor recebido: $resultado";
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Tela2 é Stateless porque ela apenas envia um valor e não precisa manter estado
class Tela2 extends StatelessWidget {
  const Tela2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(title: const Text("Tela 2")),
      body: Center(
        // Botão que envia um valor de volta
        child: ElevatedButton(
          child: const Text("Enviar 42"),
          onPressed: () {
            // pop remove a tela atual da pilha
            // 42 é o valor retornado para Tela1
            Navigator.pop(context, 42);
          },
        ),
      ),
    );
  }
}
