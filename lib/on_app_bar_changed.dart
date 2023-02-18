//página que contém a appbar dinâmica;

import 'package:flutter/material.dart';

import 'domain/tasks.dart';

//função para definir qual appBar mostrar na homePage com base no número de itens da lista selecionados;
onAppBarChanged() {
  //se a lista de itens selecionados estiver vaiza, ou seja, não existirem itens selecionados, apareça a appBar padrão do app;
  if (selectedTask.isEmpty) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 0, 75, 96),
      title: const Center(
        child: Text('Lista de Tarefas'),
      ),
    );
    //caso exista apenas um item selecionado, a appBar mudará e aparecera que existe um item selecionado, no singular;
  } else if (selectedTask.length == 1) {
    return AppBar(
      backgroundColor: const Color.fromARGB(160, 97, 115, 124),
      title: Center(
        child: Text(
          '${selectedTask.length} Tarefa Selecionada',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
  //caso exista mais de um item selecionado, a appBar mudará e aparecerá quantos itens estão selecionados;
  else {
    return AppBar(
      backgroundColor: const Color.fromARGB(160, 97, 115, 124),
      title: Center(
        child: Text(
          '${selectedTask.length} Tarefas Selecionadas',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
