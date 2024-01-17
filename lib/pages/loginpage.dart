import 'package:flutter/material.dart';
import 'package:login_page/util/routes.dart';


void main() => runApp(MaterialApp(
  home: loginpage(),
));

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String name = "";
  bool chnagebutton = false;

  final _formKey =  GlobalKey<FormState>();


moveToHome(BuildContext context) async {
  if(_formKey.currentState!.validate()) {
    setState(() {
      chnagebutton = true;
    });

    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, myroutes.profileroute);
    setState(() {
      chnagebutton = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/images/loginimage1.png', fit: BoxFit.cover),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "WELCOME ${name}",
                style: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 30,
                  color: Color(hexColor('#6699ff')),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "username",
                        labelText: "Enter Username",
                      ),
                        validator: (value){
                        if(value!.isEmpty){
                          return "username cannot be empty";
                        }
                        return null;
                        },
                        onChanged: (value){
                        name = value;
                        setState(() {
                        });
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "password",
                        labelText: "Enter Password",
                      ),
                        validator: (value){
                        if(value != null && value.length < 8){
                          return "password should be of atleast 8 char's";
                        }
                        else {
                          return null;
                        }
                        },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Material(
                      color: Color(hexColor('#6699ff')),
                      borderRadius: BorderRadius.circular(chnagebutton? 60 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 45,
                          width: chnagebutton? 60 : 150,
                          alignment: Alignment.center,
                          child: chnagebutton?(Icon(Icons.done,
                            color: Colors.white,
                          ))
                              :Text(
                              "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
          
                        ),
                      ),
                    ),
        ],
                ),
              ),
          
            ],
          ),
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

