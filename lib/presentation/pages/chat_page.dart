import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/pages/sub_pages/single_item_chat_user_page.dart';
import 'package:flutter_chat_app/presentation/widgets/theme/style.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) {
                return SingleItemChatUserPage();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
        backgroundColor: primaryColor,
      ),
    );
  }
}
