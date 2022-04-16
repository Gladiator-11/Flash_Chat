import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/chat_screen.dart';

import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/round_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcme_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isUserAvailabe = false;

  @override
  void initState() {
    super.initState();
    isUserLoggedIn();
  }

  Future<void> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? status = prefs.getBool('isloggedin');
    final String? email = prefs.getString('email');
    final String? name = prefs.getString('name');
    // print(email);
    // print(name);
    print(status);
    if (status != null && status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                ChatScreen(email.toString(), name.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Image.asset('images/logo.png'),
                  height: 60.0,
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(
              colour: Colors.blue,
              title: 'LogIn',
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundButton(
              colour: Colors.lightBlueAccent,
              title: 'Register',
              onTap: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
