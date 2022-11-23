import 'package:delivery/models/api_response.dart';
import 'package:delivery/pages/registro/provider/registro_provider.dart';
import 'package:delivery/widgets/back_button_widget.dart';
import 'package:delivery/widgets/button_widget.dart';
import 'package:delivery/widgets/input_widget.dart';
import 'package:delivery/widgets/stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  
  ///VARIABLES -> inicializarlas:
  TextEditingController emailCrtl = TextEditingController();
  TextEditingController passwordCrtl = TextEditingController();
  TextEditingController nombreCrtl = TextEditingController();
  TextEditingController apellidosCrtl = TextEditingController();
  TextEditingController telefonoCrtl = TextEditingController();
  bool disabled = false;
  
  @override
  Widget build(BuildContext context) {
    return StackWidget(
      backButton: backButton(Colors.white, context),
      img: 'assets/images/fondo-Welcome.jpeg',
      altoContenedor: 0.8,
      altoImg: 0.4,
      widgets: [
        const Text('Registro',
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30.0),
        InputWidget(
          hint: 'Nombre',
          marginTop: 10.0,
          paddingLeft: 20.0,
          textCtrl: nombreCrtl,
        ),
        InputWidget(
          hint: 'Apellidos',
          marginTop: 10.0,
          paddingLeft: 20.0,
          textCtrl: apellidosCrtl,
        ),
        InputWidget(
          hint: 'Teléfono',
          marginTop: 10.0,
          paddingLeft: 20.0,
          textCtrl: telefonoCrtl,
          keyboardType: TextInputType.phone,
        ),
        InputWidget(
          hint: 'Email',
          marginTop: 10.0,
          paddingLeft: 20.0,
          textCtrl: emailCrtl,
          keyboardType: TextInputType.emailAddress,
        ),
        InputWidget(
          hint: 'Contraseña',
          marginTop: 10.0,
          paddingLeft: 20.0,
          textCtrl: passwordCrtl,
          obscure: true,
        ),
        ButtonWidget(
          texto: 'Crear cuenta',
          marginTop: 40.0,
          ancho: 0.4,
          alto: 0.05,
          onClick: (){
            _registrarUsuario();
          },
        ),
      ]
    );
  }

  ///FUNCIONES:
  void _registrarUsuario() async {
    //todo-> DESACTIVAMOS LE BOTÓN:
    setState(() {
      disabled = true;
    });

    Map<String, dynamic> cliente = {
      'user': {
        'email': emailCrtl.text,
        'password': passwordCrtl.text,
      },
      'role': 'ROLE_CLIENTE',
      'cliente': {
        'nombre': nombreCrtl.text,
        'apellidos': apellidosCrtl.text,
        'telefono': telefonoCrtl.text
      }
    };

    //todo-> LLAMAR A LA API Y ENVIAR EL CLIENTE:
    RegistroService registroService = RegistroService();
    ApiResponse apiResponse = await registroService.registroUser(cliente);
    if(!apiResponse.error) {
      Navigator.pop(context);
    } else {
      //todo-> MOSTRAR UN MENSAJE DICIENDO QUE HA OCURRIDO UN ERROR:
      Fluttertoast.showToast(msg: apiResponse.apiErrorMessage);
    }

    //todo-> ACTIVAMOS DE NUEVO EL BOTÓN:
    setState(() {
      disabled = false;
    });
  }
}
