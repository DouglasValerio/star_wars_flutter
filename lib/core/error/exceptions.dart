class ApiException implements Exception {
  final String errorMessage;
  final int statusCode;

  ApiException(this.errorMessage, this.statusCode);
}

class CacheException implements Exception {}
