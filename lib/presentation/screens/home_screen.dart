import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/pages/calls_page.dart';
import 'package:flutter_chat_app/presentation/pages/camera_page.dart';
import 'package:flutter_chat_app/presentation/pages/chat_page.dart';
import 'package:flutter_chat_app/presentation/pages/status_page.dart';
import 'package:flutter_chat_app/presentation/widgets/custom_tab_bar.dart';
import 'package:flutter_chat_app/presentation/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearch = false;
  PageController _pageViewController = PageController(initialPage: 1);
  int _currentPageIndex = 1;
  List<Widget> _pages = [CameraPage(), ChatPage(), StatusPage(), CallsPage()];

  _buildSearch() {
    return Container(
      height: 45,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            spreadRadius: 1,
            offset: Offset(0.0, 0.5),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search...",
            prefixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isSearch = false;
                });
              },
              child: Icon(Icons.arrow_back),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPageIndex != 0
          ? AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: _isSearch == false
                  ? Text(
                      "",
                      style: TextStyle(fontSize: 0.0),
                    )
                  : _buildSearch(),
              elevation: 0.0,
              backgroundColor:
                  _isSearch == false ? primaryColor : Colors.transparent,
              title: _isSearch == false
                  ? Text("Ant ChatApp")
                  : Container(
                      height: 0.0,
                      width: 0.0,
                    ),
              actions: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isSearch = true;
                    });
                  },
                  child: Icon(
                    Icons.search,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Icon(
                  Icons.more_vert,
                )
              ],
            )
          : null,
      body: Column(
        children: [
          _isSearch == false
              ? _currentPageIndex != 0
                  ? CustomTabBar(index: _currentPageIndex)
                  : Container(
                      height: 0.0,
                      width: 0.0,
                    )
              : Container(
                  height: 0.0,
                  width: 0.0,
                ),
          Expanded(
            child: PageView.builder(
              itemCount: _pages.length,
              controller: _pageViewController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return _pages[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
