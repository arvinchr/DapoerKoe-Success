import 'package:UTS/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:UTS/menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HalamanLogin extends StatefulWidget {
  static const String id = 'login';

  @override
  _HalamanLoginState createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  bool _isPasswordVisible = true;

  final _auth = FirebaseAuth.instance;
  String usernameInput;
  String passwordInput;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.amber,
      resizeToAvoidBottomPadding: false,

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0, bottom: mediaQuery.viewInsets.bottom),
          child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Gambar(
                        asetGambar: 'assets/img/spoon.png'
                    ),

                    Text(
                      'DapoerKoe',
                      style:
                      GoogleFonts.playfairDisplay(
                          fontWeight: FontWeight.bold,
                          fontSize: 40
                      ),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),

                    Form(
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                onChanged: (value){
                                  usernameInput = value;
                                },
                                validator: (value){
                                  if(value.isEmpty){
                                    return 'Email can not be empty';
                                  }
                                  return null;
                                },

                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    prefixIcon: Icon(
                                        Icons.email,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: GoogleFonts.roboto(
                                        fontStyle: FontStyle.normal,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[200]
                                ),
                              ),
                            ),

                            Container(
                              child: TextFormField(
                                onChanged: (value){
                                  passwordInput = value;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your Password!';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    prefixIcon: Icon(
                                        Icons.lock,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: GoogleFonts.roboto(
                                          fontStyle: FontStyle.normal,
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                      onPressed: (){
                                        setState((){
                                          _isPasswordVisible = !_isPasswordVisible;
                                        });
                                      }),
                                ),
                                obscureText: _isPasswordVisible,
                              ),
                              padding: EdgeInsets.only(top: 10.0),
                            ),
                          ]
                        ),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                        ),

                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent),
                          ),
                          child: Text(
                            'LOG IN',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 18,
                            ),
                          ),
                          onPressed: () async{
                            try{
                              final newuser= await _auth.signInWithEmailAndPassword(
                                  email: usernameInput,
                                  password: passwordInput);
                              if(newuser!= null){
                                Navigator.pushReplacementNamed(context, MainMenu.id);
                              }
                            }catch(e){
                              print(e);
                            }
                          },
                        ),
                      ],
                    ),
                  ]
                ),
          ),
        ),
      ),
    );
  }
}

class Gambar extends StatelessWidget{
  final String asetGambar;

  const Gambar({
    Key key,
    this.asetGambar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Image.asset(
            asetGambar,
            height:250,
            width:250,
          )
        ]
    );
  }
}