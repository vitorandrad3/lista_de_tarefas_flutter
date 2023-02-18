//lista com as tarefas;
List<Task> tasksList = [
  //instanciação das terefas.
  Task(name: 'estudar programação', checkboxvalue: false),
  Task(name: 'ir à academia', checkboxvalue: false),
  Task(name: 'tomar água', checkboxvalue: false),
  Task(name: 'correr', checkboxvalue: false),
];
//lista das tarefas que serão selecionadas na HomePage
List<Task> selectedTask = [];

//criação da classe "task", que definirá as caracteristicas de uma tarefa
class Task {
  Task({required this.name, required this.checkboxvalue});

  final String? name;
  bool checkboxvalue;
}
