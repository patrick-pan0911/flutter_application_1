//task 3
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/repositories/post_repository.dart';

class PostsPage extends StatefulWidget {
  final PostRepository repository;

  const PostsPage({
    super.key,
    required this.repository, //when creating an instance of PostsPage, you must provide a PostRepository implementation
  });

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<Post>> _postsFuture; //a Future that will hold the list of posts once they are fetched from the repository

  //initState is called when the stateful widget is first created. Here, we initialize the _postsFuture by calling the fetchPosts method of the repository
  @override
  void initState() { //this method is called when the stateful widget is first created
    super.initState();
    _postsFuture = widget.repository.fetchPosts();
  }

  void _retry() { //this method is called when the user taps the "Retry" button after a failed fetch attempt. It re-fetches the posts by calling fetchPosts again and updating the _postsFuture
    setState(() { //setState is called to notify the framework that the state of the widget has changed and it needs to rebuild the UI with the new data
      _postsFuture = widget.repository.fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: FutureBuilder<List<Post>>( //FutureBuilder is a widget that builds itself based on the latest snapshot of interaction with a Future. It takes a Future and a builder function that defines how to build the UI based on the state of the Future
        future: _postsFuture,
        builder: (context, snapshot) {

          // if the Future is still loading, show a loading indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // if the Future has an error, show an error message and a retry button
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Failed to load posts'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _retry,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // if the Future has data, show the list of posts
          final posts = snapshot.data ?? [];

          //generates a ListView of ListTile widgets, where each ListTile displays the title of a post. 
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];

              return ListTile(
                title: Text(post.title),
              );
            },
          );
        },
      ),
    );
  }
}