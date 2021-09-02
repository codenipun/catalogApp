import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("Welcome",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Username", hintText: "Enter username"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password", hintText: "Enter password"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () async{
              setState(() {
                changeButton = true;
              });

              await Future.delayed(Duration(seconds: 1));
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: changeButton? 40:120,
              height: 40,
              alignment: Alignment.center,
              child: changeButton?Icon(Icons.done,color: Colors.white,) : Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  // shape: changeButton?BoxShape.circle:BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(changeButton? 40: 8)
                  ),
            ),
          )
          // ElevatedButton(
          //   onPressed: () {
          //
          //   },
          //   child: Text("Login"),
          //   style: TextButton.styleFrom(),
          // )
        ],
      ),
    ));
  }
}
 