import 'package:UTS/Profile/username.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget{
  static const String id = 'register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  final _auth = FirebaseAuth.instance;
  String emailInput;
  String passwordInput;
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.amber,
      resizeToAvoidBottomPadding: false,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0, bottom: mediaQuery.viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Register',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              Form(
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return 'Email can not be empty';
                        }
                        return null;
                      },
                      onChanged: (value){
                        emailInput = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),

                    TextFormField(
                      obscureText: _isPasswordVisible,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Paswword can not be empty!';
                        }else if(value.length < 7){
                          return 'Password are at least 7 characters long!';
                        }else
                          return null;
                      },
                      onChanged: (value){
                        passwordInput = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: (){
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },

                    child: Text(
                      'BACK',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 18,
                      ),
                    ),
                  ),

                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                    ),

                    child: Text(
                      'SIGN UP',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 18,
                      ),
                    ),

                    onPressed: () async{
                      try{
                        final newuser= await _auth.createUserWithEmailAndPassword(
                            email: emailInput,
                            password: passwordInput
                        );

                        if(newuser!= null){
                          Navigator.popAndPushNamed(context, UserDisplayName.id);
                        }
                      }
                      catch(e){
                        print(e);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}