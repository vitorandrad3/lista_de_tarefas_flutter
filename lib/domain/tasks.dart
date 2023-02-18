//lista com as tarefas;
List<Task> tasksList = [
  //instanciação das terefas.
  Task(name: 'Invadir o congresso', checkboxvalue: false),
  Task(name: 'Sonegar imposto', checkboxvalue: false),
];
//lista das tarefas que serão selecionadas na HomePage
List<Task> selectedTask = [];

//criação da classe "task", que definirá as caracteristicas de uma tarefa
class Task {
  Task({required this.name, required this.checkboxvalue});

  final String? name;
  bool checkboxvalue;
}
