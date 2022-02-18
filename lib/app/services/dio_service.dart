import 'package:dio/dio.dart';

abstract class IDioService {
  Dio getDio();
}

class DioService implements IDioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/',
      ),
    );
  }
}
