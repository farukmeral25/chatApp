import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/widgets/theme/style.dart';

class CustomTabBar extends StatefulWidget {
  final int index;

  const CustomTabBar({Key key, this.index}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: primaryColor),
      child: Row(
        children: [
          Container(
            width: 40,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: CustomTabButton(
              text: "CHAT",
              textColor: widget.index == 1 ? Colors.white : textIconColorGray,
              borderColor:
                  widget.index == 1 ? textIconColorGray : Colors.transparent,
            ),
          ),
          Expanded(
            child: CustomTabButton(
              text: "STATUS",
              textColor: widget.index == 2 ? Colors.white : textIconColorGray,
              borderColor:
                  widget.index == 2 ? textIconColorGray : Colors.transparent,
            ),
          ),
          Expanded(
            child: CustomTabButton(
              text: "CALLS",
              textColor: widget.index == 3 ? Colors.white : textIconColorGray,
              borderColor:
                  widget.index == 3 ? textIconColorGray : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabButton extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;

  const CustomTabButton(
      {Key key,
      this.text,
      this.borderColor,
      this.textColor,
      this.borderWidth = 3.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
