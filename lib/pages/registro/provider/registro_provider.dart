import 'dart:convert';
import 'package:delivery/utils/base_url.dart';
import 'package:http/http.dart';
import '../../../models/api_response.dart';

class RegistroService {
  Future<ApiResponse> registroUser(Map<String, dynamic> cliente) async {
    ApiResponse _apiResponse = ApiResponse();

    //todo-> DENTRO DEL POST HAY QUE PASAR VARIAS COSAS:
    //todo-> 1º LA URL DEL ENDPOINT, PARSEARLO DE URI
    //todo-> 2º EL JSON QUE QUEREMOS ENVIAR QUE LO CODIFICAREMOS A PARTIR DEL MAP
    //todo-> 3º LOS HEADERS -> CABECERAS QUE INDICAN QUÉ TIPO DE CONTENIDO MANEJA LA PETICIÓN -> JSON
    Response res = await post(Uri.parse('${baseUrl}user/'),
      body: json.encode(cliente),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    if(res.statusCode == 200) {
      _apiResponse.error = false;
    } else {
      //todo-> AQUÍ DEBERÍAMOS CONTROLAR LOS CÓDIGOS DE ERROR MEDIANTE UN SWITCH AUNQUE PARA MAYOR RAPIDEZ VAMOS A PONER UNO GENERAL:
      _apiResponse.error = true;
      _apiResponse.apiErrorMessage = '¡ERROR! Inténtelo más tarde';
    }

    return _apiResponse;
  }
}
