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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: greenColor.withOpacity(.5),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Icon(
              Icons.message,
              color: Colors.white.withOpacity(.6),
              size: 40,
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Start chat with your friends and family,\n on AntChat",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
        backgroundColor: primaryColor,
      ),
    );
  }

  Widget myChatList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return SingleItemChatUserPage();
        },
      ),
    );
  }
}
