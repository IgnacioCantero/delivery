import 'package:delivery/pages/comenzarPedido/comenzar_pedido_page.dart';
import 'package:delivery/pages/login/login_page.dart';
import 'package:delivery/pages/registro/registro_page.dart';
import 'package:flutter/widgets.dart';

final routes = <String, WidgetBuilder> {
  '/' : (BuildContext context) => const LoginPage(),
  '/registro' : (BuildContext context) => const RegistroPage(),
  '/pedido' : (BuildContext context) => const PedidoPage(),
};