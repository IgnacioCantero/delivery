import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {

  ///VARIABLES CONSTRUCTOR:
  String texto;
  double marginTop;
  double ancho;
  double alto;
  VoidCallback onClick; //todo-> VoidCallback => DEVOLVER UNA FUNCIÓN VACÍA QUE RELLENA EL PADRE, DE TAL MANERA QUE NO ES EL PROPIO BOTÓN EL QUE LA GESTIONA SI NO EL PADRE
  bool disabled;

  ButtonWidget({Key? key,
    required this.texto,
    required this.marginTop,
    required this. ancho,
    required this.alto,
    required this.onClick,
    this.disabled = false,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {

    ///VARIABLES -> inicializarlas
    var anchoPantalla = MediaQuery.of(context).size.width;
    var altoPantalla = MediaQuery.of(context).size.height;

    return Container(
      width: anchoPantalla * widget.ancho,
      height: altoPantalla * widget.alto,
      margin: EdgeInsets.only(top: widget.marginTop),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: widget.disabled ? null : (){
          widget.onClick();
        },
        child: Text(widget.texto),
      ),
    );
  }
}
