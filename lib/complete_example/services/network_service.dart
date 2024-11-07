import 'package:dio/dio.dart';

class NetworkService {
  final Dio dio;

  NetworkService(this.dio);

  Future<String> fetchData() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/todos/1');
    return response.data['title'];
  }
}
