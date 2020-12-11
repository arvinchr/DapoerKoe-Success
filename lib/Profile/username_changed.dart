import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:UTS/Profile/profile.dart';

class UserDisplayNameChanged extends StatefulWidget {
  static const String id = 'userdisplayname_changed';

  @override
  _UserDisplayNameChangedState createState() => _UserDisplayNameChangedState();
}

class _UserDisplayNameChangedState extends State<UserDisplayNameChanged> {

  final _activeUser = FirebaseAuth.instance.currentUser;
  String _setDisplayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.amber,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Change Your Profile Name',
                  style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),
                ),

                SizedBox(height: 20.0),

                TextField(
                  onChanged: (value) {
                    _setDisplayName = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Display Name',
                  ),
                ),

                SizedBox(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, HalamanProfile.id);
                      },
                      child: Text('BACK'),
                    ),

                    RaisedButton(
                      onPressed: () async {
                        try {
                          await _activeUser.updateProfile(
                              displayName: _setDisplayName
                          );
                          if (_setDisplayName != null) {
                            Navigator.popAndPushNamed(context, HalamanProfile.id);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text('SUBMIT'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
