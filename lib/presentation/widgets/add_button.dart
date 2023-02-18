import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //definição das características do corpo do botão;
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
          //botão  retangular com cantos arredondados;
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          //dimenões do botão (altura e largura);
          fixedSize: const Size(200, 45)),
      //função onPressed para executar a funcionalidade do botão;
      onPressed: onPressed,
      //indificador do botão;
      child: const Text(
        'ADICIONAR',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
