import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/homepage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isloggedin= false;
  User user;

    checkAuthentication() async{

    _auth.authStateChanges().listen((user) {
      if(user==null){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Start(),
        ));
      }
    });

  }

  getUser() async{
    User firebaseuser =  _auth.currentUser;
    await firebaseuser?.reload();
    firebaseuser =  _auth.currentUser;
    if(firebaseuser!=null){


    setState(() {
        this.user =firebaseuser;
        this.isloggedin=true;
      });
    }

  }
  signout() async{
    _auth.signOut();
  }
  @override
  void initState(){
    this.checkAuthentication();
    this.getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: !isloggedin? CircularProgressIndicator():
        Column(children:
         <Widget>[
Container(
  height:400,
  child:Image(image: AssetImage("images/welcome.jpg"),
  fit: BoxFit.contain,)
),
Container(
  child:Text("Hello ${user.displayName} you are logged in as ${user.email}",
  style:TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),
  )
),
     SizedBox(height:20),
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                        onPressed: signout,
                      child:
                      Text('Signout',
                      style:TextStyle(
                        color: Colors.white,fontSize:20.0,fontWeight:FontWeight.bold),
                        ),
                        color:Colors.orange,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        )
        ],
        )
      ),

    );
  }
}