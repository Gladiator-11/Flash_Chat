import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/round_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void authentication() async {
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return ChatScreen(
          email: email,
          name: password,
        );
      }));
    } else {
      Navigator.pushNamed(context, LoginScreen.id);
    }
  }

  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Your Email'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Your Password'),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundButton(
                    colour: Colors.blue,
                    title: 'LogIn',
                    onTap: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      authentication();

                      setState(() {
                        showSpinner = false;
                      });
                    },
                  ),
                  RoundButton(
                    colour: Colors.grey,
                    title: 'Google Sign In',
                    onTap: () async {
                      GoogleSignInAccount? user;
                      final googleUser = await GoogleSignIn().signIn();
                      if (googleUser == null) return;
                      user = googleUser;
                      print(user.displayName);
                      print(user.email);

                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ChatScreen(
                          email: user!.email,
                          name: user.displayName ?? 'no name',
                        );
                      }));
                    },
                  )
                ],
              ),
            ),
            if (showSpinner)
              Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              )
          ],
        ),
      ),
    );
  }
}
