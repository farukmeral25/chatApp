import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/pages/sub_pages/single_item_call_page.dart';
import 'package:flutter_chat_app/presentation/widgets/theme/style.dart';

class CallsPage extends StatefulWidget {
  @override
  _CallsPageState createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return SingleItemCallPage();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: Icon(Icons.add_call,color: Colors.white,),
      ),
    );
  }
}
