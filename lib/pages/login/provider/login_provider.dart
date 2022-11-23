import 'dart:convert';
import 'package:delivery/models/api_response.dart';
import 'package:delivery/models/user.dart';
import 'package:delivery/utils/base_url.dart';
import 'package:delivery/utils/sharedPreferences/shared_preferences.dart';
import 'package:http/http.dart';

class LoginService {
  Future<ApiResponse> loginUser(Map<String, dynamic> user) async {
    ApiResponse _apiResponse = ApiResponse();
    Response res = await post(
      Uri.parse('${baseUrl}login_check'),
      body: json.encode(user),
      headers: {'Content-Type': 'application/json'}
    );
    if(res.statusCode == 200) {
      _apiResponse.error = false;
      //todo-> GUARDAR EN shared_preferences LOS DATOS PARA PODER USARLOS MÁS TARDE:
      UserPreferences prefs = UserPreferences();
      //todo-> json.decode -> PARSEA DE JSON A MAP:
      prefs.saveUserOnLogin(User.fromJson(json.decode(res.body)));
    } else {
      _apiResponse.error = true;
      _apiResponse.apiErrorMessage = '¡ERROR! Inténtelo más tarde';
    }
    return _apiResponse;
  }
}
