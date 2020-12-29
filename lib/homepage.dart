import 'package:flutter/material.dart';
import 'package:flutter_login/login.dart';
import 'package:flutter_login/signup.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:
        Column(children:
        <Widget>[
Container(
  child:Image(image: AssetImage("images/start.png"),
  ),
),
RichText(text: TextSpan(text:'Welcome to' ,
style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Colors.black,
),
children: <TextSpan>[
  TextSpan(
    text: 'XXGrocery' , style:
    TextStyle(
      fontSize:30,fontWeight: FontWeight.bold, color: Colors.orange,
    )
  )
]
),
),
Text('Fresh Products at your nearest shop', style: TextStyle(color:Colors.black,),),
SizedBox(height: 25,),
Row(mainAxisAlignment: MainAxisAlignment.center,
  children:
<Widget>[
RaisedButton(padding:EdgeInsets.only(left:25,right:25),
onPressed: (){
Navigator.push(context, MaterialPageRoute(
          builder: (context) => Login(),
        ));
},child:Text('LOGIN',style:
TextStyle(fontSize:20,
fontWeight:FontWeight.bold,
color: Colors.white),
),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
color:Colors.orange,
),
SizedBox(width: 20,),
RaisedButton(
  padding:EdgeInsets.only(left:25,right:25),
  onPressed: (){
Navigator.push(context, MaterialPageRoute(
          builder: (context) => SignUp(),
        ));
},child:Text('REGISTER',style:
TextStyle(fontSize:20,
fontWeight:FontWeight.bold,
color: Colors.white),
),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
color:Colors.orange,
),
SizedBox(height:20),


],
),
SignInButton(
  Buttons.Google,
  text: "Sign up with Google",
  onPressed: () {},
)
        ],
        ),

      ),

    );

  }
}