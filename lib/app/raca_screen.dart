import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClassesTela extends StatefulWidget {
  const ClassesTela({super.key});

  @override
  State<ClassesTela> createState() => _ClassesTelaState();
}

class _ClassesTelaState extends State<ClassesTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: const Text("Classes Disponíveis"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: GridView(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 8,
            right: 8,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Guerreiro"),
                    content: const Text(
                        """Classe corpo a corpo focada em habilidades de combate, que são:\n\nArmadura Completa - Ao receber um acerto critico, faça um teste de Armadura, se bem sucedido ignore o dano crítico.
                              \nAtaque Contínuo - Ao reduzir um inimigo a 0 PV, você pode gastar 1 PM para realizar um ataque adicional a um inimigo adjacente.
                              \nCrítico Automático - Uma vez por dia você pode consumir 2 PM para realizar um acerto crítico automático."""),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Ok"),
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                color: const Color.fromARGB(255, 255, 228, 149),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    (Image.asset(
                      'lib/resources/sword.png',
                      width: 80,
                      height: 80,
                      color: const Color.fromARGB(255, 67, 67, 67),
                    )),
                    const SizedBox(height: 8),
                    const Text(
                      "Guerreiro",
                      style: TextStyle(
                          fontSize: 24, color: Color.fromARGB(255, 67, 67, 67)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Ranger"),
                    content: const Text(
                        """Classe de combate à distância com as seguintes habilidades:\n\nChuva de Disparos - Você pode realizar 1 tiro adicional por 1 PM.
                              \nCompanheiro Animal - Você recebe um Aliado animal com as características: Sentidos Especiais, Inculto e Modelo Especial.
                              \nCrítico Aprimorado (inimigo) - Quando você realiza um ataque contra seu Inimigo predileto, seu Poder de Fogo é duplicado."""),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Ok"),
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                color: const Color.fromARGB(255, 149, 255, 151),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    (Image.asset(
                      'lib/resources/bow.png',
                      width: 80,
                      height: 80,
                      color: const Color.fromARGB(255, 67, 67, 67),
                    )),
                    const SizedBox(height: 8),
                    const Text(
                      "Ranger",
                      style: TextStyle(
                          fontSize: 24, color: Color.fromARGB(255, 67, 67, 67)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Ladino"),
                    content: const Text(
                        """Classe corpo a corpo focada em combate furtivo e em especialidades:
                              \n\nAtaque Furtivo - Ao atacar um inimigo indefeso, pode gastar 2 PM para ignorar sua Armadura.
                              \nMestre das Escaladas - Você utiliza sua velocidade normal ao escalar.
                              \nRei do Crime - Você pode gastar 1 PM para adquirir um sucesso automático ao usar a perícia Crimes."""),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Ok"),
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                color: const Color.fromARGB(255, 149, 154, 255),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    (Image.asset(
                      'lib/resources/dagger.png',
                      width: 80,
                      height: 80,
                      color: const Color.fromARGB(255, 67, 67, 67),
                    )),
                    const SizedBox(height: 8),
                    const Text(
                      "Ladino",
                      style: TextStyle(
                          fontSize: 24, color: Color.fromARGB(255, 67, 67, 67)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Bárbaro"),
                    content: const Text(
                        """Classe resistente de combate corpo a corpo focada na força:
                              \n\nForça Bruta - Ao realizar um ataque concentrado você ignora a Armadura do alvo.
                              \nFúria de Combate - Você pode gastar 2 PM para invocar uma fúria que concede Força + 2 e Resistência + 1, durante um período de rodadas igual a sua Resistência, quando a fúria termina você perde 1 pontos em todos os atributos por 1 hora.
                              \nNunca Indefeso - Em qualquer situação que possua liberdade de movimentos você não é considerado Indefeso."""),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Ok"),
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                color: const Color.fromARGB(255, 255, 149, 149),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    (Image.asset(
                      'lib/resources/axe.png',
                      width: 80,
                      height: 80,
                      color: const Color.fromARGB(255, 67, 67, 67),
                    )),
                    const SizedBox(height: 8),
                    const Text(
                      "Bárbaro",
                      style: TextStyle(
                          fontSize: 24, color: Color.fromARGB(255, 67, 67, 67)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
