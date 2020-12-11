import 'package:UTS/Profile/username_changed.dart';
import 'package:UTS/login.dart';
import 'package:UTS/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HalamanProfile extends StatefulWidget {
  static const String id = 'profile';

  @override
  _HalamanProfileState createState() => _HalamanProfileState();
}

class _HalamanProfileState extends State<HalamanProfile> {

  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  dynamic userDisplayName = 'User';
  var _firebasefirestore = FirebaseFirestore.instance.collection('dapoerkoe');

  void initState() {
    super.initState();
    getCurrentUser();
    streamFirestore();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      if (loggedInUser.displayName != null) {
        userDisplayName = loggedInUser.displayName;
      }
    }
  }

  void streamFirestore() {
    _firebasefirestore.doc(loggedInUser.email).snapshots().listen((event) {
      if(event.data() != null){
        setState(() {
          userDisplayName = event.data()['username'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.amber,
      resizeToAvoidBottomPadding: false,

      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
          textAlign: TextAlign.center,
        ),

        actions: [
          IconButton(
            icon: IconMenu(
              gambarIcon: Icons.logout,
            ),
            onPressed: (){
              //_signOut();
              Navigator.pushReplacementNamed(context, HalamanLogin.id);
            },
          ),
        ],

        leading: IconButton(
          icon: IconMenu(
            gambarIcon: Icons.arrow_back,
          ),
          onPressed: (){
            Navigator.popAndPushNamed(context, MainMenu.id);
          },
        ),
      ),

      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16, bottom: mediaQuery.viewInsets.bottom),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),

                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2, blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0,10)
                          )
                        ],

                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://icons-for-free.com/iconfiles/png/512/people+person+profile+user+icon-1320186207447274965.png'
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.white
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),

              buildTextField("Username", "$userDisplayName", UserDisplayNameChanged.id),

              SizedBox(
                height: 35,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.transparent
                      ),
                    ),
                    child: Text(
                      'SAVE',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () async {
                      Navigator.pushReplacementNamed(context, MainMenu.id);
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

  Widget buildTextField(String labelText, String placeholder, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            icon: Icon(
                Icons.edit
            ),
            onPressed: (){
              Navigator.pushReplacementNamed(context, route);
            },
          ),
        ),
      ),
    );
  }
}


class Gambar extends StatelessWidget{
  final String asetGambar;
  final String netGambar;

  const Gambar({
    Key key,
    this.asetGambar,
    this.netGambar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Image.asset(
            asetGambar,
            height:250,
            width:250,
          ),
          Image.network(
            netGambar,
            height: 250,
            width: 250,
          ),
        ]
    );
  }
}

class IconMenu extends StatelessWidget{
  final IconData gambarIcon;
  final Color warnaIcon;

  const IconMenu({
    Key key,
    this.gambarIcon,
    this.warnaIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            gambarIcon,
            color: warnaIcon,
          )
        ]
    );
  }
}