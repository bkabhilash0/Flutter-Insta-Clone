import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final Function onPress;
  const ChatPage({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              onPress();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            )),
        title: const Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.blue,
          )),
          Container(
            height: 200,
            color: Colors.red,
          ),
          Container(
            color: Colors.amber,
            height: 200,
          )
        ],
      ),
    );
  }
}
