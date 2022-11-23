import 'package:delivery/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  ///VARIABLES -> inicializarlas:
  String _inMemoryToken = '';
  int _cliente = 0;

  //todo-> CUANDO LEÉMOS ALGO GUARDADO EN LA MEMÓRIA DEL TELÉFONO PASA COMO EN LA API, ES ASÍNCRONO.
  //todo-> DEVOLVER EL TOKEN GUARDADO EN MEMÓRIA:
  Future<String> get userAccesToken async {
    //todo-> 1º COMPROBAR SI YA ESTÁ GUARDADO EN RAM:
    if(_inMemoryToken.isNotEmpty) {
      return _inMemoryToken;
    }
    //todo-> 2º SI NO ESTÁ GUARDADO EN LA VARIABLE -> SACARLO DE LA MEMÓRIA FÍSICA:
    _inMemoryToken = await _loadTokenFromShared();
    return _inMemoryToken;
  }

  Future<int> get clienteAccesToken async {
    if(_cliente != 0) {
      return _cliente;
    }
    _cliente = await _loadClienteFromShared();
    return _cliente;
  }

  //todo-> 4º GUARDARLO EN LA MEMÓRIA FÍSICA:
  saveUserOnLogin(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', user.token!);
    prefs.setInt('id_cliente', user.idCliente!);
    prefs.setInt('id_user', user.id!);
  }

  ///FUNCIONES:
  //todo-> 3º SACARLO DE LA MEMÓRIA FÍSICA DEL TERMINAL:
  Future<String> _loadTokenFromShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesToken = '';
    //todo-> 3.1 COMPROBAR QUE EXISTE ESA VARIABLE GUARDADA EN MEMÓRIA FÍSICA:
    final token = prefs.getString('token');
    if(token != null) {
      accesToken = token;
    }
    return accesToken;
  }

  Future<int> _loadClienteFromShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesCliente = 0;
    final clienteId = prefs.getInt('id_cliente');
    if(clienteId != null) {
      accesCliente = clienteId;
    }
    return accesCliente;
  }
}
