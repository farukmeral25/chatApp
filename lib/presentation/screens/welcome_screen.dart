import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/screens/registration_screen.dart';
import 'package:flutter_chat_app/presentation/widgets/theme/style.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to Ant Chat",
              style: TextStyle(
                fontSize: 20,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 290,
              width: 290,
              child: Image.asset("assets/brand.jpg"),
            ),
            Column(
              children: [
                Text(
                  "Read our Privacy Policy Tap, 'Agree and continue' to accept the Terms of Service.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegistrationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "AGGRE AND CONTINUE",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
