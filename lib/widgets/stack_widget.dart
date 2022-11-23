import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {

  ///VARIABLES CONSTRUCTOR:
  List<Widget> widgets;
  double altoImg;
  double altoContenedor;
  String img;
  Widget backButton;

  StackWidget({Key? key,
    this.altoImg = 0.5,
    this.altoContenedor = 0.5,
    required this.img,
    required this.widgets,
    this.backButton = const SizedBox()
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///VARIABLES -> inicializarlas:
    //todo-> PARA DEVOLVER EL ANCHO Y EL ALTO DE LA PANTALLA:
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(  //todo-> Stack => PARA APILAR LAS COSAS (UNA IMÁGEN DE FONDO, UN TEXTO, ETC)
              children: [
                Image(
                  width: double.infinity,
                  height: alto * altoImg,
                  fit: BoxFit.cover,
                  image: AssetImage(img),
                ),
                Container(
                  //todo-> AQUÍ DEBERÍA IR UN BOTÓN PARA NAVEGAR ATRÁS PERO COMO ES LA PRIMERA PANTALLA NO LE PONDREMOS NADA:
                  margin: const EdgeInsets.only(top: 50.0),
                  child: backButton,
                ),
              ],
            ),
            //todo-> Transform => WIDGET QUE MODIFICA LA POSICIÓN DE SU HIJO
            Transform.translate(
              offset: const Offset(0.0, -50),
              //todo-> EL child VA A SER QUIEN CONTENGA LOS INPUTS DE LOGIN (EMAIL, CONTRASEÑA, BOTÓN PARA ENTRAR, ...)
              child: Container(
                width: double.infinity,
                height: alto * altoContenedor,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children:
                      //todo-> AQUÍ VA TODA LA INFORMACIÓN:
                      widgets,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
