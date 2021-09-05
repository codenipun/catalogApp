import 'package:flutter/material.dart';


class myDrawer extends StatelessWidget {
const myDrawer({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(child: UserAccountsDrawerHeader(accountName: Text("pawan"), accountEmail: Text(:mtechviral),))
        Padding : EdgeInsets.zero,;
        child : UserAccountsDrawerHeader(
          margin : Edge
        )]
      ],
    ),
  );
}
}
