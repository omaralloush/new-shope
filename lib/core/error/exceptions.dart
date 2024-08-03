//date
class ServerException implements Exception {}

class CacheException implements Exception {}

//route
class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}

class ApiExeption implements Exception {
  final String message;
  const ApiExeption(this.message);
}
