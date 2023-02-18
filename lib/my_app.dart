import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/presentation/add_task_page.dart';
import 'package:lista_de_tarefas/presentation/home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // variavel page para armazenar a informação de em qual tela se encontra a aplicação;
  int page = 0;
  // page controler para controlar a mudança das páginas;
  late PageController nav;

//sobrescrita do método iniState para inicializar o page controler;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    nav = PageController(initialPage: page);
  }

//função criada para atualizar o navigationBar quando a página for alterada com o deslize do dedo;
  setCurrentPage(currentpage) {
    setState(() {
      page = currentpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // widget pageview para navegar entre as telas deslizando;
        body: PageView(
          controller: nav,
          //chamada da função para alterar o índice "page" e selecionar o ícone da BottomNavigationBar quando a página for alterada;
          onPageChanged: setCurrentPage,
          //páginas a serem navegadas;
          children: const [
            HomePage(),
            AddTask(),
          ],
        ),
        //barra dos botões de navegação;
        bottomNavigationBar: BottomNavigationBar(
          //cor dos ícones não selecionados;
          unselectedItemColor: Colors.white,
          //cor do ícone selecionado (ícone da página onde se encontra a aplicação corrente);
          selectedItemColor: const Color.fromARGB(255, 0, 195, 175),
          //cor de fundo da barra
          backgroundColor: const Color.fromARGB(255, 0, 75, 96),
          //índice da página corrente (onde a aplicação se encontra);
          currentIndex: page,
          //ícones da barra de navegação;
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Tarefas',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle), label: 'Nova Tarefa')
          ],
          //definição do que acontece quando se toca no ícone;
          onTap: (page) {
            // chama o controller do page view para navegar entre as telas com uma animação;
            nav.animateToPage(page,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
        ),
      ),
    );
  }
}
