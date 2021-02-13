//1.단위테스트 Mockito를 사용한 의존성 테스트
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

Future<Post> fetchPost(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // 만약 서버로의 요청이 성공했다면, JSON으로 파싱합니다.
    return Post.fromJson(json.decode(response.body));
  } else {
    // 만약 요청이 실패하게 되면, 에러를 던집니다.
    throw Exception('Failed to load post');
  }
}

class Post {
  final String title;

  Post({this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title']
    );
  }
}

class MockClient extends Mock implements http.Client {}

main() {
  group('fetchPost', () {
    test('returns a Post if the http call completes successfully', () async {
      final client = MockClient();

      // 제공된 http.Client를 호출했을 때, 성공적인 응답을 반환하기 위해
      // Mockito를 사용합니다.
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await fetchPost(client), const TypeMatcher<Post>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // 제공된 http.Client를 호출했을 때, 실패 응답을 반환하기 위해
      // Mockito를 사용합니다.
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchPost(client), throwsException);
    });
  });
}
