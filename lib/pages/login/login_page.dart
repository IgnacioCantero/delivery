import 'package:delivery/models/api_response.dart';
import 'package:delivery/pages/login/provider/login_provider.dart';
import 'package:delivery/widgets/button_widget.dart';
import 'package:delivery/widgets/input_widget.dart';
import 'package:delivery/widgets/stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/colors/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///VARIABLES -> inicializarlas:
  TextEditingController emailCrtl = TextEditingController();
  TextEditingController passwordCrtl = TextEditingController();
  bool disabled = false;

  @override
  Widget build(BuildContext context) {
    return StackWidget(
      altoImg: 0.5,
      altoContenedor: 0.6,
      img: 'assets/images/login-fondo.jpeg',
      widgets: [
        const Text('Bienvenido',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
          ),
        ),
        const Text('Accede a tu cuenta',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 13.0,
          ),
        ),
        InputWidget(
          hint: 'Email',
          marginTop: 40.0,
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
        //todo-> BOTÓN DE ENTRAR PARA HACER LOGIN:
        ButtonWidget(
          texto: 'Entrar',
          marginTop: 30.0,
          ancho: 0.5,
          alto: 0.05,
          disabled: disabled,
          onClick: (){
            _loginUser();
          }
        ),
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Aún no tienes cuenta?',
                style: TextStyle(
                  color: gris,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                ),
              ),
              GestureDetector(
                onTap: (){
                  //todo-> NAVEGAR A LA PÁGINA DE REGISTRO:
                  Navigator.of(context).pushNamed('/registro');
                },
                child: const Text(' ¡Regístrate!',
                  style: TextStyle(
                    color: amarillo,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///FUNCIONES:
  void _loginUser() async {
    setState(() {
      disabled = true;
    });

    Map<String, dynamic> user = {
      'username': emailCrtl.text,
      'password': passwordCrtl.text,
    };

    LoginService loginService = LoginService();
    ApiResponse apiResponse = await loginService.loginUser(user);

    //todo-> SEGÚN LO QUE VENGA DE LA API HACER UNA COSA U OTRA:
    if(!apiResponse.error) {
      //todo-> IR A LA PÁGINA DE COMENZAR PEDIDO:
      //todo-> Navigator.pushNamed -> AÑADE A LA PILA DE NAVEGACIÓN LA PÁGINA (PODEMOS VOLVER HACIA ATRÁS)
      //todo-> Navigator.pushReplacementNamed -> NAVEGA Y BORRA TODO EL HISTORIAL DE NAVEGACIÓN (NO PODEMOS VOLVER ATRÁS):
      Navigator.pushReplacementNamed(context, '/pedido');
    } else {
      Fluttertoast.showToast(msg: '¡ERROR! Credenciales incorrectos');
    }

    setState(() {
      disabled = false;
    });
  }
}
