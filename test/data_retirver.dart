import 'dart:convert';
import 'dart:io';

Future<List<dynamic>> getPosts() async {
  final jsonData =
      await File('/Users/abdo/Desktop/projects/temp/flutter_application_1/test/test_data/posts.json').readAsString();
  final mockPosts = jsonDecode(jsonData);
  return mockPosts;
}
