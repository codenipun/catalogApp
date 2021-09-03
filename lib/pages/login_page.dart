import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("Welcome $name",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Username", hintText: "Enter username"),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password", hintText: "Enter password"),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Paswword cannot be empty";
                      } else if (value != null && value.length < 6) {
                        return "Password length should be atleast 6";
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Material(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(changeButton ? 40 : 8),
              child: InkWell(
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: changeButton ? 40 : 120,
                  height: 40,
                  alignment: Alignment.center,
                  child: changeButton
                      ? Icon(Icons.done, color: Colors.white)
                      : Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),

                  // shape: changeButton?BoxShape.circle:BoxShape.rectangle,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
