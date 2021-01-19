import 'package:flutter/material.dart';

class SingleItemStoryPage extends StatefulWidget {
  @override
  _SingleItemStoryPageState createState() => _SingleItemStoryPageState();
}

class _SingleItemStoryPageState extends State<SingleItemStoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    child: ClipRRect(
                      child: Image.asset("assets/profile_default.png"),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "12.47 AM",
                        style: TextStyle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 10),
            child: Divider(
              thickness: 1.50,
            ),
          )
        ],
      ),
    );
  }
}
