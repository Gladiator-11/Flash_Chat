import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton(
      {required this.colour, required this.onTap, required this.title});

  final String title;
  final Color colour;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onTap as void Function()?,
          minWidth: 50.0,
          height: 20.0,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
