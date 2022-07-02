/// Identifica erro retornado em uma requisição com a API.
class ServerException implements Exception {
  ServerException({
    required this.statusCode,
    required this.message,
    this.request,
  });

  final int statusCode;
  final String message;
  final String? request;
}

/// Identifica um erro ocorrido no acesso ao armazenamento do dispositivo.
class GeneralException implements Exception {
  GeneralException({
    required this.message,
  });

  final String message;
}
