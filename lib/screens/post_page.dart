import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/post_item.dart';

class PostPage extends StatelessWidget {
  static String routeName = "/post-page";
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Post"),
      ),
      body: PostItem(
        index: 1,
        imageUrl: url,
      ),
    );
  }
}
