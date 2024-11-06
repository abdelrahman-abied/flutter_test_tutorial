import 'package:dio/dio.dart';
import 'package:flutter_application_1/posts/api_service/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../data_retirver.dart';
import 'api_service_test.mocks.dart';

// class MockDio extends Mock implements Dio {}

@GenerateMocks([Dio])
void main() {
  late MockDio dio;
  late ApiService apiService;
  setUp(() {
    dio = MockDio();
    apiService = ApiService(dio);
  });
  group('ApiService', () {
    // final mockPosts = [
    //   {
    //     "userId": 1,
    //     "id": 1,
    //     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    //     "body":
    //         "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    //   },
    //   {
    //     "userId": 1,
    //     "id": 2,
    //     "title": "qui est esse",
    //     "body":
    //         "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
    //   },
    // ];
    test('getPosts', () async {
      final mockPosts = await getPosts();
      // Arrange
      when(dio.get('https://jsonplaceholder.typicode.com/posts')).thenAnswer(
        (_) async => Response(
          data: mockPosts,
          requestOptions: RequestOptions(path: 'https://jsonplaceholder.typicode.com/posts'),
          statusCode: 200,
          statusMessage: 'OK',
        ),
      );
      // Act
      final posts = await apiService.getPosts();
      // Assert
      expect(posts.length, 100);
    });
    test('getPosts - failure (status code != 200)', () async {
      // Arrange
      when(dio.get(ApiService.posts)).thenAnswer((_) async => Response(
            statusCode: 400,
            statusMessage: 'Bad Request',
            requestOptions: RequestOptions(path: ApiService.posts),
          ));

      // Act
      try {
        await apiService.getPosts();
      } catch (e) {
        // Assert
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Failed to load posts'));
      }
    });
    test('getPosts - throw exception', () async {
      // Arrange
      when(dio.get(ApiService.posts)).thenThrow(Exception('Failed to load posts'));
      // Act
      try {
        await apiService.getPosts();
      } catch (e) {
        // Assert
        expect(e, isInstanceOf<Exception>());
        expect(e, isA<Exception>());
        expect(e.toString(), contains('Failed to load posts'));
      }
    });
    test('getPosts - throw exception', () async {
      // Arrange
      when(dio.get(ApiService.posts)).thenThrow(
        DioException(
          message: 'Failed to load posts',
          requestOptions: RequestOptions(path: ApiService.posts),
        ),
      );
      // Act

      expect(apiService.getPosts(), throwsA(isA<Exception>()));
      expect(() async => await apiService.getPosts(), throwsA(isA<Exception>()));
    });
    test('getPosts - throw exception', () async {
      // Arrange
      when(dio.get(ApiService.posts)).thenThrow(
        DioException(
          message: 'Failed to load posts',
          requestOptions: RequestOptions(path: ApiService.posts),
        ),
      );
      try {
        await apiService.getPosts();
      } catch (e) {
        expect(e.toString(), contains('Failed to load posts'));
      }
    });
    test('getPosts - throw exception with custom message', () async {
      // Arrange
      when(dio.get(ApiService.posts)).thenThrow(
        DioException(
          message: 'Failed to load posts',
          requestOptions: RequestOptions(path: ApiService.posts),
        ),
      );
      try {
        await apiService.getPosts();
      } catch (e) {
        expect(e.toString(), contains('Failed to load posts'));
      }
    });
  });
}
