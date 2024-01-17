import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[800],
            ),
            accountName: Text("Rishu"),
            accountEmail: Text("raxxbarn@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/ir.jpeg'),
            ),
          ),
          ListTile(
            title: new Text("Profile"),
            leading: new Icon(CupertinoIcons.profile_circled),
          ),
          Divider( height: 0.1,),
          ListTile(
            title: new Text("Inbox"),
            leading: new Icon(Icons.mail),
          ),
          ListTile(
            title: new Text("Primary"),
            leading: new Icon(Icons.inbox),
          ),
          ListTile(
            title: new Text("Social"),
            leading: new Icon(Icons.people),
          ),
          ListTile(
            title: new Text("Promotions"),
            leading: new Icon(Icons.local_offer),
          )
        ],
      ),
    );
  }
}