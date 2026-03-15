# Perguntas para Discussão: Flutter & Dart

## 🏗️ Estrutura e Widgets

### 1. Por que usamos construtor?
O construtor é o ponto de entrada de um Widget. No Flutter, ele é essencial para:
* **Passagem de Dados:** Permite que uma tela receba informações de outra (ex: IDs, objetos ou configurações).
* **Imutabilidade:** Como a maioria dos Widgets são `final`, o construtor define os valores iniciais que não mudarão durante o ciclo de vida daquela instância.
* **Identificação:** Passar a `Key` para que o Framework gerencie a árvore de elementos corretamente.

### 2. Por que a Tela2 pode ser Stateless?
Uma tela pode ser `StatelessWidget` se o seu estado interno **não precisa mudar** após ser construída.
* Se a `Tela2` apenas exibe dados recebidos pelo construtor e não possui interações que alterem variáveis locais (como contadores ou campos de texto dinâmicos), ela não precisa da complexidade de um `StatefulWidget`.
* **Performance:** Widgets Stateless são mais leves para o sistema renderizar.

### 3. O dado pode mudar depois que a tela é criada?
* **Em um StatelessWidget:** Não diretamente. Se o dado original mudar na "tela pai", o Flutter reconstrói a `Tela2` inteira com a nova informação, mas a instância anterior é descartada.
* **Em um StatefulWidget:** Sim. Através do método `setState()`, você avisa ao Flutter que um dado mudou e a interface precisa ser redesenhada para refletir essa mudança.

---

## ⏳ Assincronismo (Async, Await e Future)

### 4. O que acontece se remover o await?
O código **não esperará** a conclusão da tarefa. 
* A execução pulará imediatamente para a próxima linha.
* A variável que deveria receber o resultado conterá uma instância de `Future<Tipo>` em vez do valor real (como uma String ou um objeto).

### 5. O que acontece se remover o async?
O Dart retornará um erro de compilação se você tentar usar a palavra-chave `await` dentro de uma função que não esteja marcada como `async`. O `async` avisa ao compilador que aquela função sempre retornará um `Future`.

### 6. O que é Future?
Um `Future` é um objeto que representa uma **operação atrasada**. É uma "promessa" de que um valor (ou um erro) chegará em algum momento. Enquanto o processo (como uma busca no banco de dados) acontece, o `Future` fica no estado "pendente".

### 7. Quando o valor realmente é recebido?
O valor é recebido no momento em que a operação assíncrona é "completada" com sucesso.
* No código com `await`, a linha seguinte só é executada quando o valor chega.
* No nível do sistema, isso ocorre quando o **Event Loop** do Dart processa a resposta da tarefa assíncrona.