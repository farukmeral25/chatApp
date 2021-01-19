import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/widgets/theme/style.dart';

class SingleItemCallPage extends StatefulWidget {
  @override
  _SingleItemCallPageState createState() => _SingleItemCallPageState();
}

class _SingleItemCallPageState extends State<SingleItemCallPage> {
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
                      Row(
                        children: [
                          Icon(
                            Icons.call_received,
                            color: primaryColor,
                            size: 18,
                          ),
                          Text(
                            "Yesterday",
                            style: TextStyle(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Icon(Icons.call,color: primaryColor,)
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
