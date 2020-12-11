import 'package:UTS/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryOrder extends StatefulWidget {
  static const String id = 'history';

  @override
  _HistoryOrderState createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> {

  dynamic userDisplayName = 'User';
  User loggedInUser;

  String namaMenu1;
  String namaMenu2;
  String namaMenu3;
  String namaMenu4;

  String jumlahPesanan1;
  String jumlahPesanan2;
  String jumlahPesanan3;
  String jumlahPesanan4;
  String totalHarga;

  final _auth = FirebaseAuth.instance;
  var _firebaseFirestore = FirebaseFirestore.instance.collection('order');

  void streamFirestoreData() {
    _firebaseFirestore.doc(loggedInUser.email).snapshots().listen((event) {
      if (event.data() != null) {
        setState(() {
          namaMenu1 = event.data()['namamenu1'];
          namaMenu2 = event.data()['namamenu2'];
          namaMenu3 = event.data()['namamenu3'];
          namaMenu4 = event.data()['namamenu4'];
          jumlahPesanan1 = event.data()['jumlahpesanan1'];
          jumlahPesanan2 = event.data()['jumlahpesanan2'];
          jumlahPesanan3 = event.data()['jumlahpesanan3'];
          jumlahPesanan4 = event.data()['jumlahpesanan4'];
          totalHarga = event.data()['totalharga'];
        });
      }
    });
  }

  void deleteHistory() async {
    await _firebaseFirestore.doc(loggedInUser.email).delete();
  }

  void initState() {
    super.initState();
    getCurrentUser();
    streamFirestoreData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.amber,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: IconMenu(
            gambarIcon: Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, MainMenu.id);
          },
        ),
        title: Text(
          "History",
          style:
          GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://cdn2.tstatic.net/palu/foto/bank/images/berikut-resep-membuat-daging-rendang.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  '$namaMenu1',
                  style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Jumlah Pesanan : $jumlahPesanan1",
                  style:
                  GoogleFonts.roboto(),
                ),
              ),
            ),
          ),

          Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/img/Ayam pop.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  '$namaMenu2',
                  style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Jumlah Pesanan : $jumlahPesanan2",
                  style:
                  GoogleFonts.roboto(),
                ),
              ),
            ),
          ),

          Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/img/telor balado.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  '$namaMenu3',
                  style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Jumlah Pesanan : $jumlahPesanan3",
                  style:
                  GoogleFonts.roboto(),
                ),
              ),
            ),
          ),

          Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/img/mie goreng.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  '$namaMenu4',
                  style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Jumlah Pesanan : $jumlahPesanan4",
                  style:
                  GoogleFonts.roboto(),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 30.0,
          ),

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total : $totalHarga',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent),
                ),
                child: Text(
                  "CLEAR",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 18,
                  ),
                ),
                onPressed: (){
                  deleteHistory();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconMenu extends StatelessWidget {
  final IconData gambarIcon;
  final Color warnaIcon;
  final double sizeIcon;

  const IconMenu({
    Key key,
    this.gambarIcon,
    this.warnaIcon,
    this.sizeIcon,
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
            size: sizeIcon,
          )
        ]
    );
  }
}