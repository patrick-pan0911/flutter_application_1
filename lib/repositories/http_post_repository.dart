//task 3
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/post.dart';
import 'post_repository.dart';

class HttpPostRepository implements PostRepository {
  @override
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load posts');
    }

    final List<dynamic> data = jsonDecode(response.body);

    // Convert the JSON data into a list of Post objects using the fromJson factory constructor
    return data.map((json) => Post.fromJson(json)).toList();
  }
}