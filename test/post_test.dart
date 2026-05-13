//task 3
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/models/post.dart';

void main() {
  group('Post', () {

    // This test checks if a Post object can be created with an id and title
    test('creates Post with id and title', () {
      final post = Post(id: 1, title: 'Hello');

      expect(post.id, 1);
      expect(post.title, 'Hello');
    });

    // This test checks if a Post object can be created from a JSON map
    test('creates Post from json', () {
      final json = {
        'id': 1,
        'title': 'Hello from API',
      };

      final post = Post.fromJson(json);

      expect(post.id, 1);
      expect(post.title, 'Hello from API');
    });

    // This test checks if different JSON maps create different Post objects
    test('creates different Post from different json', () {
      final json = {
        'id': 2,
        'title': 'Second post',
      };

      final post = Post.fromJson(json);

      expect(post.id, 2);
      expect(post.title, 'Second post');
    });
  });
}