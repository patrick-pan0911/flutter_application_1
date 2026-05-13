//task 3
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/repositories/post_repository.dart';
import 'package:flutter_application_1/widgets/posts_page.dart';
import 'dart:async';

void main() {
  group('PostsPage', () {
    testWidgets('shows loading indicator while fetching posts', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostsPage(
            repository: LoadingPostRepository(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows posts when fetch succeeds', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostsPage(
            repository: SuccessPostRepository(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Test Post'), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('shows error message and retry button when fetch fails',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: PostsPage(
            repository: ErrorPostRepository(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Failed to load posts'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });

    testWidgets('retries fetching posts when Retry is tapped', (tester) async {
      final repository = RetryPostRepository();

      await tester.pumpWidget(
        MaterialApp(
          home: PostsPage(
            repository: repository,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Failed to load posts'), findsOneWidget);

      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();

      expect(find.text('Retried Post'), findsOneWidget);
      expect(repository.callCount, 2);
    });
  });
}

// These are mock implementations of the PostRepository interface used for testing the PostsPage widget. 
// Each implementation simulates a different scenario (success, error, slow response, and retry logic) to test how the PostsPage handles these cases.
class SuccessPostRepository implements PostRepository {
  @override
  Future<List<Post>> fetchPosts() async {
    
    return [
      Post(id: 1, title: 'Test Post'),
    ];
  }
}

//simulates a failed fetch by throwing an exception when fetchPosts is called
//test if the PostsPage shows an error message and a retry button
class ErrorPostRepository implements PostRepository {
  @override
  Future<List<Post>> fetchPosts() async {
    throw Exception('error');
  }
}

//simulates a slow response by delaying the Future for 1 second before returning the list of posts
//test if the PostsPage shows a loading indicator
class LoadingPostRepository implements PostRepository {
  final Completer<List<Post>> completer = Completer<List<Post>>();

  @override
  Future<List<Post>> fetchPosts() {
    return completer.future;
  }
}

class RetryPostRepository implements PostRepository {
  // records how many times fetchPosts has been called. 
  // The first time it's called, it throws an exception to simulate a failed fetch.
  // The second time it's called, it returns a list of posts to simulate a successful retry.
  int callCount = 0;

  @override
  Future<List<Post>> fetchPosts() async {
    callCount++;

    if (callCount == 1) {
      throw Exception('first fail');
    }

    return [
      Post(id: 2, title: 'Retried Post'),
    ];
  }
}