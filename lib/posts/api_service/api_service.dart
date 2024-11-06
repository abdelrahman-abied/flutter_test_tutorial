import 'package:dio/dio.dart';
import 'package:flutter_application_1/posts/models/posts.dart';

class ApiService {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  static const posts = '$baseUrl/posts';
  final Dio _dio;

  ApiService(this._dio);

  Future<List<Post>> getPosts() async {
    try {
      final response = await _dio.get(posts);
      if (response.statusCode == 200) {
        return postFromJson(response.data);
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e, stackTrace) {
      throw Exception('Failed to load posts $e $stackTrace');
    }
  }
}

List<Post> postFromJson(List str) => List<Post>.from(str.map((x) => Post.fromJson(x)));
