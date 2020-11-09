import 'package:flutter/material.dart';

//import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';
import 'searchRecipe.dart';
import 'recipeDetails.dart';
import 'test.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false,
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
      image: AssetImage('assets/backgrnd2.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'E-Mail', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _formData['email'] = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _formData['password'] = value;
        });
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: true,
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  /* _showWarningDialog (BuildContext context ){
     showDialog(
       context:context, builder:(BuildContext context){
            return AlertDialog(title:Text('Login is not valid !'),content:Text(
            'Check if your email containes"@" and your password length should be greater than 4 chars '),
            actions: <Widget>[
              FlatButton(child:Text('DISCARD'),onPressed: (){
                Navigator.pop(context);

               },),
              FlatButton(child:Text('CONTINUE'),onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context,true);

              },),
            ],);
          });
  }*/
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(
                    height: 10.9,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildPasswordTextField(),
                  _buildAcceptSwitch(),
                  RaisedButton(
                      textColor: Colors.white,
                      child: Text('LOGIN'),
                      onPressed:() {
                        //if(_formData['email'].contains('@')& _formData['password'].length>4){

                       
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()
                              // Navigator.push(context, MaterialPageRoute( builder:(BuildContext context) =>Test()
                              ),
                        );
                        //}else{return(_showWarningDialog(context)) ;}
                      }),
                  SizedBox(
                    height: 10.9,
                  ),
                  FlatButton(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black54),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
 /*Future <void> signIn() async {
   try{
     
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: _formData['email'] , password: _formData['password']);
     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()
                              // Navigator.push(context, MaterialPageRoute( builder:(BuildContext context) =>Test()
                              ));

   }catch(e){
     print(e.message);

   }
  }*/
}
