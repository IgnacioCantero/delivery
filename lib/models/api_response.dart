class ApiResponse {
  ///ATRIBUTOS:
  late Object _data;
  late bool _error;
  String? _apiErrorMessage;

  ///CONSTRUCTORES:
  //todo-> ESTA CLASE NO VA A TENER CONSTRUCTOR, POR ESO LOS ATRIBUTOS SON late

  ///GETTERS&SETTERS:
  Object get data => _data;

  set data(Object value) {
    _data = value;
  }

  bool get error => _error;

  String get apiErrorMessage => _apiErrorMessage!;

  set apiErrorMessage(String value) {
    _apiErrorMessage = value;
  }

  set error(bool value) {
    _error = value;
  }
}
