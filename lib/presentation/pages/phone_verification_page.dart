import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/pages/set_initial_profile_page.dart';
import 'package:flutter_chat_app/presentation/widgets/theme/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerificationPage extends StatefulWidget {
  @override
  _PhoneVerificationPageState createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                Text(
                  "Verify your phone number",
                  style: TextStyle(
                    fontSize: 18,
                    color: greenColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.more_vert),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Bu bir mesajlaşma uygulamasıdır. Henüz yapım aşamasında olup ticari bir amaç gözetilmemektedir.",
              style: TextStyle(fontSize: 16),
            ),
            _pinCodeWidget(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SetInitialProfilePage(),
                      ),
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pinCodeWidget() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            PinCodeTextField(
              controller: _pinCodeController,
              length: 6,
              backgroundColor: Colors.transparent,
              obsecureText: true,
              onChanged: (pinCode) {
                print(pinCode);
              },
            ),
            Text("Enter your 6 digit code"),
          ],
        ),
      ),
    );
  }
}
