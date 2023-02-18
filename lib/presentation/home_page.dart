// página inicial do app;

import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/presentation/widgets/task_card.dart';
import '../on_app_bar_changed.dart';
import '../domain/tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //esqueleto da HomePage
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 99, 114),
      //chama a função que definirá qual appBar será mostrada;
      appBar: onAppBarChanged(),
      //chamada do listView para a contrução da lista que será exibida;
      body: ListView.separated(
          // definição da construção dos itens da lista  com o context (***ver mais sobre BuildContext***) e o índice (números dos itens na lista);
          itemBuilder: (BuildContext context, int index) {
            //inicialização do widget "Dismissible" para remover os itens da lista arrastando-os para o lado;
            return Dismissible(
              //definição da direção que executará a ação (neste caso da esquerda para a direita);
              direction: DismissDirection.startToEnd,
              //definição do que aparecerá ao fundo do item da lista qe está sendo excluindo (neste caso usa-se um container vermelho);
              background: Container(
                color: const Color.fromARGB(255, 155, 16, 16),
              ),
              //definição da chave (o que identifica identificador) de cada item da lista (***ver mais sobre***);
              key: UniqueKey(),
              //definição do que acontece ao arrastar o iten (neste caso, exclui o item da lista de tarefas, consequentemente o removendo da tela);
              onDismissed: (direction) => setState(() {
                tasksList.remove(tasksList[index]);
              }),
              //inicialização do ListTile (os itens da lista)
              child: TaskCard(
                index: index,
                onChanged: (value) => setState(
                  () {
                    //construção de um ternário (estrutura condicional) para selecionar o checkbox caso esteja desselecionado e se estivar selecionado, desseleciona-lo;
                    tasksList[index].checkboxvalue
                        ? tasksList[index].checkboxvalue = false
                        : tasksList[index].checkboxvalue = true;
                  },
                ),
                onLongPress: () {
                  //verificação se o item já está na lista de selecionados;
                  selectedTask.contains(tasksList[index])
                      ? setState(() {
                          //se estiver é removido;
                          selectedTask.remove(tasksList[index]);
                        })
                      : setState(
                          () {
                            //se não estiver é adicionado;
                            selectedTask.add(tasksList[index]);
                          },
                        );
                },
                onPressed: () {
                  setState(
                    () {
                      tasksList.remove(tasksList[index]);
                    },
                  );
                },
              ),
            );
          },
          //separador do listView.SEPARETED (neste caso é um Divider) (***ver mais sobre este builder***);
          separatorBuilder: (__, ___) => const Divider(),
          //definição de quantos itens a lista terá (neste caso é o próprio tamanho da lista '.length');
          itemCount: tasksList.length),
      //botão de ação flutuante que aprece somente quando um item da lista é selecionado, a fim de remover os itens selecionados de uma única vez;
      //localização do botão;
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          //ternário usado para o botão aparecer quando um item for selecionado (neste caso se verifica se a lista de tarefas selecionadas está vvazia);
          selectedTask.isEmpty
              //se estiver vazia retorna-se um valor nulo, ou seja, o botão não existe;
              ? null
              //caso contrário cria um botão extendido;
              : FloatingActionButton.extended(
                  backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                  label: const Text(
                    'EXCLUIR',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  //se o botão for pressionado irá excluir todos os itens selecionados;
                  onPressed: () {
                    //para excluir os itens foi usado uma estrutura de repetição, fazendo com que a ação de excluir percorra todos os itens a semrem excluidos;
                    for (int i = selectedTask.length - 1; i >= 0; i--) {
                      setState(
                        () {
                          //primeiro removo o item da lista principal;
                          tasksList.remove(selectedTask[i]);
                          /*depois remove o item da lista dos item selecionados, pois caso contrário o contador de itens selecionados não mudará,
                          então não teríamos mais o item na lista, porém ainda estaria no contador de itens selecionados;*/
                          selectedTask.remove(selectedTask[i]);
                        },
                      );
                    }
                  },
                ),
    );
  }
}
