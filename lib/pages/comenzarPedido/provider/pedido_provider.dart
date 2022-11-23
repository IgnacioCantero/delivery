import 'dart:convert';

import 'package:delivery/models/cliente.dart';
import 'package:delivery/utils/base_url.dart';
import 'package:delivery/utils/sharedPreferences/shared_preferences.dart';
import 'package:http/http.dart';

class PedidoService {
  //todo-> LLAMAR A LA API PARA QUE TRAIGA LOS DATOS DEL CLIENTE:
  //todo-> 1º ID CLIENTE -> shared_preferences -> MEMÓRIA FÍSICA DEL TELÉFONO:
  UserPreferences userPreferences = UserPreferences();
  //todo-> 2º LLAMAR A GET CLIENTE:
  Future<Cliente> getCliente() async {
    //todo-> NECESITO EL TOKEN:
    String token = await userPreferences.userAccesToken;
    int idCliente = await userPreferences.clienteAccesToken;
    
    Response res = await get(Uri.parse('${baseUrl}cliente/$idCliente'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}'
      }
    );
    
    if(res.statusCode == 200) {
      //todo-> PASAR DE JSON A MAP Y DE MAP A CLIENTE:
      return Cliente.fromJson(json.decode(res.body));
    } else {
      throw Exception('¡ERROR AL TRAER EL CLIENTE!');
    }
  }
}
