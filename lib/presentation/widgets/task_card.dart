import 'package:flutter/material.dart';

import '../../domain/tasks.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.index,
    required this.onChanged,
    required this.onLongPress,
    required this.onPressed,
  });

  final int index;
  final void Function(bool?) onChanged;
  final void Function() onLongPress;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //definição de um CheckBox no inicio de cada item da lista
      leading: Checkbox(
        //definição do corpo do CheckBox (neste caso, um círculo);
        shape: const CircleBorder(),
        //cor do CheckBox quando selecionado;
        activeColor: Colors.green,
        /*Valor inicial de cada checkbox, neste caso, o valor é obtido direto dos objetos "task" que estão em uma lista, sempre incialmente como false 
                  ()desmarcado.
                  Necessita obter o valor direto dos objetos individualmente para que quando o valor(true/false) for mudado em um dos itens da lista, altere em cada um
                  de forma individual, caso contrário mudará para todos simultaneamente; */
        value: tasksList[index].checkboxvalue,
        //definição do que acontece quando se toca em um CheckBox
        onChanged: onChanged,
      ),
      //título de cada item da lista, obtém-se acessando o nome do objeto "task",o qual é selecionado com base no index definido no listview (item 1,2,3...);
      title: Text(tasksList[index].name.toString()),
      //cor do texto em cada item SELECIONADO da lisita
      selectedColor: const Color.fromARGB(255, 0, 0, 0),
      //cor de fundo de cada item selecionado da Lista
      selectedTileColor: const Color.fromARGB(255, 99, 216, 232),
      /*seleçao dos item da lista quando pressionados por um tempo (onlongPress), quando se aperta um dos items da lista, outra lista recebe o objeto selecionado
                e é feita a verificação dos termos da intersecção da lista de objetos principais com os objetos selecionados usando o método .contains()  ()*/
      selected: selectedTask.contains(tasksList[index]),
      /*seleção dos itens da lista, acontece com a definição de um ternário para se o item a ser selecionado não estiver na lista de objetos selecionados (selectecTask)
                adiciona o item a lista de selecionados e se já estiver na lista de selecionados, é removido da lista de selecionados. */
      onLongPress: onLongPress,
      //definição do corpo de cada item da lista (neste caso é um retangulo com as bordas arredondadas);
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      //cor do corpo do item;
      tileColor: const Color.fromARGB(187, 255, 255, 255),
      // margem interna do item (neste caso foi usado para definir a espessura do corpo de cada item);
      contentPadding: const EdgeInsets.all(5),
      // definição do que aprece ao final de cada item ("trailing") (neste caso é um ícone botão usado para remover um item da lista);
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        //função onpressed para remover o item da lista quando pressionado;
        onPressed: onPressed,
      ),
    );
  }
}
