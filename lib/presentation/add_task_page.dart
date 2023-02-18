//página para novos itens serem adicionados na lista;

import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/domain/tasks.dart';
import 'package:lista_de_tarefas/presentation/widgets/add_button.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  //definição da chave (identficador) do formulário (campo para escrever novas tarefas);
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //esqueleto da página;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 99, 114),
      body: Center(
        //coluna para alocar os widgets de fomra ordenada;
        child: Column(
          children: [
            //sized box para dar espaçamento;
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            //texto principal da página;
            const Text(
              'adicione uma nova tarefa',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            //formulário para a adição de novas tarefas;
            Form(
              //chave do formulário (criado no widget de estado);
              key: _form,
              //sizedbox que encapsula o compo de texto do fromulario, a fim de defnir suas dimensões;
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.87,
                height: MediaQuery.of(context).size.height * 0.1,
                //campo de texto do formulário, onde se colocará a nova tarefa que será adicionada;
                child: TextFormField(
                  //método de validação do valor inserido no campo de text;
                  validator: (value) {
                    /*uso de um ternário para verificar se há algo no campo de texto, se houver, a aplicação segue normalmente, salvando a nova tarefa,
                    caso contrário retornará um aviso que é necessário que escreva algo para ser adicionado na lista; */
                    return value!.isEmpty ? 'escreva uma tarefa' : null;
                  },
                  /*função onSaved para salvar o valor do campo de texto (neste caso a String "value" do campo de texto é usada para instanciar uma nova "task" e depois
                   adicionar o objeto instanciado na lista de tarefas para ser exibida pelo listview da HomePage);*/
                  onSaved: (value) {
                    //instanciação do novo objeto do tipo "task";
                    Task newtask = Task(name: value, checkboxvalue: false);
                    //adição do novo objeto na lista de tarefas;
                    tasksList.add(newtask);
                  },
                  //definição da cor do texto inserido no campo;
                  style: const TextStyle(color: Colors.white),
                  //definição das caracteristicas do corpo do campo de texto;
                  decoration: const InputDecoration(
                      //definição do tipo de bordas do campo (neste caso, um retangulo com cantos arredondados e contorno branco)
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      //definição do ícone no início do campo de texto;
                      prefixIcon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      //"rótulo" do campo de texto;
                      label: Text(
                        'Nova Tarefa',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            //botão para chamar o método onSaved e salvar o valor do campo de texto na lista de tarefas;
            AddButton(
              onPressed: () {
                //setstate para atualizar as alterações do programa;
                setState(
                  () {
                    //criação de uma variável lógica para verificar se a condição validade do campo de texto;
                    final bool isValid = _form.currentState!.validate();
                    //estrutura condicional para verificar a condição
                    if (isValid) {
                      /*se a condição for válida, chama o método onSaved (".save") e salva o estado atual (os dados que estão no campo de texto) por meio da 
                      chave do formulário ("_form");*/
                      _form.currentState!.save();
                      //depois exibe uma mensagem confirmando para o usuário que a tarefa foi salva;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Nova tarefa adicionada')));
                      //logo após, limpa o estado do campo(limpa o valor que foi salvo e que ainda está escrito no textField);
                      _form.currentState!.reset();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
