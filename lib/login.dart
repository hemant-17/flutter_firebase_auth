import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'landing.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _email, _password;

  checkAuthentication() async{

    _auth.authStateChanges().listen((user) {
      if(user!=null){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => HomePage()

        ));
        print(user);
      }
    });
    @override
    void initState(){
      super.initState();
      this.checkAuthentication();
    }
  }
  login() async{

    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      try{
        UserCredential user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);

      }
      catch(e){
        showError(e.message);
      }
    }


  }
          showError(String errormessage){
      showDialog(
        context: context,
      builder:(BuildContext context){
        return AlertDialog(title: Text('ERROR'),
        content:Text(errormessage),
        actions: <Widget>[
          FlatButton(onPressed: (){
Navigator.of(context).pop();
          }, child: null)
        ],
        );
      }

      );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
          child:Column(
            children: <Widget>[
              Container(
                height:200,
               child:
                Image(image: AssetImage("images/login_img.png"),
                fit:BoxFit.contain,

              ),
              ),
              Container(

                child:Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child:TextFormField(
                          validator: (input){
                            if(input.isEmpty){
                              return 'Enter Email';

                            }
                          },
                            decoration:InputDecoration(
                            labelText:'Email',
                            prefixIcon: Icon(Icons.email),

                            ),
                            onSaved: (input) => _email = input
                          ,

                        ),
                      ),
                           Container(
                        child:TextFormField(
                          validator: (input){
                            if(input.length < 6){
                              return 'Provide Minimum 6 Charachter';

                            }
                          },
                            decoration:InputDecoration(
                            labelText:'Password',
                            prefixIcon: Icon(Icons.lock),


                            ),
                            obscureText: true,

                            onSaved: (input) => _password = input
                          ,

                        ),
                      ),
                      SizedBox(height:20),
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                        onPressed: login,
                      child:
                      Text('Login',style:TextStyle(
                        color: Colors.white,fontSize:20.0,fontWeight:FontWeight.bold),
                        ),
                        color:Colors.orange,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        )
                    ],

                  ),
                  )
              )
              ],
              )
        ),
      ),

    );
  }
}