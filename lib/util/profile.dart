import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/homepage.dart';

void main() => runApp(MaterialApp());

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int AppLevel =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "My ID",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 30,
            color: Colors.white,

          ),
        ),
        centerTitle: true,
        backgroundColor: Color(hexColor('#6699ff')),
        elevation: 0.0,
      ),
      drawer: Drawer(
        elevation: 20.0,
        backgroundColor: Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(hexColor('#6699ff')),
              ),
              accountName: Text("Rishu"),
              accountEmail: Text("raxxbarn@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/ir.jpeg'),
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
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Container(
        width: 150,
        height: 40,
        margin: EdgeInsets.only(left: 35),
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => homepage() )
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(hexColor('#6699ff')),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ), child: Text('My App',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400
          ),
        ),
        ),
      ),
          FloatingActionButton(
            onPressed: (){
              setState(() {
                AppLevel += 1;
              });
            },
            child: Icon(Icons.add),
            backgroundColor: Color(hexColor('#6699ff')),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/ir.jpeg'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 40.0,
              color: Colors.black,
            ),
            Text(
              "Name",
              style: TextStyle(
                color: Colors.grey[900],
                letterSpacing: 2.0,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              "Rishu",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 22,

              ),
            ),
            SizedBox(height: 30.0),
            Text(
              "Field",
              style: TextStyle(
                color: Colors.grey[900],
                letterSpacing: 2.0,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              "Flutter Development",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              "Level",
              style: TextStyle(
                color: Colors.grey[900],
                letterSpacing: 2.0,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              "Intermediate",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_city,
                  color: Colors.grey[900],
                ),
                SizedBox(width: 10.0),
                Text(
                  "Chandigarh (India)",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              "Times You Clicked",
              style: TextStyle(
                color: Colors.grey[900],
                letterSpacing: 2.0,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              '$AppLevel',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int hexColor(String c){
  String sColor = '0xff' + c;
  sColor = sColor.replaceAll('#', '');
  int dColor = int.parse(sColor);
  return dColor;
}
