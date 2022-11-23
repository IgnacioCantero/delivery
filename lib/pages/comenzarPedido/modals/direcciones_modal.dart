import 'package:delivery/models/cliente.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelecDireccionPage extends StatefulWidget {

  List<Direcciones> direcciones;

  SelecDireccionPage({Key? key, required this.direcciones}) : super(key: key);

  @override
  State<SelecDireccionPage> createState() => _SelecDireccionPageState();
}

class Direccion {
}

class _SelecDireccionPageState extends State<SelecDireccionPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: const SizedBox(),  //todo-> PARA QUE NO APAREZCA EL BOTÓN DE IR ATRÁS QUE SALE POR DEFECTO
          middle: const Text('Seleccionar dirección'),
          trailing: TextButton(
            child: const Text('Añadir dirección',
              style: TextStyle(
                color: Colors.green,
                fontSize: 10.0,
              ),
            ),
            onPressed: (){},
          ),
        ),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 50.0),
            alignment: Alignment.center,
            child: Column(
              children: const [
                Text('No hay direcciones disponibles'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
