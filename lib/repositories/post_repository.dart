//task 3
import 'package:flutter_application_1/models/post.dart';

// Abstract class defining the contract for fetching posts. 
abstract class PostRepository {
  Future<List<Post>> fetchPosts();
}