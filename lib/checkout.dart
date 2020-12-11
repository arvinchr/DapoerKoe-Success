import 'package:UTS/history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:UTS/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckOut extends StatefulWidget {
  static const String id = 'checkout';

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  String namaMENU1 = 'Rendang';
  String namaMENU2 = 'Ayam Pop';
  String namaMENU3 = 'Telur Balado';
  String namaMENU4 = 'Mie Goreng';

  int jumlahPESANAN1 = 0;
  int jumlahPESANAN2 = 0;
  int jumlahPESANAN3 = 0;
  int jumlahPESANAN4 = 0;
  int totalHARGA = 0;

  int _r = 0;
  int _t = 0;
  int _m = 0;
  int _a = 0;

  int sum = 0;

  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        leading: IconButton(
          icon: IconMenu(
            gambarIcon: Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, MainMenu.id);
          },
        ),
        title: Text(
          "Checkout",
          style:
          GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),

        actions: [
          IconButton(
            icon: Icon(
                Icons.list
            ),
            onPressed: (){
              Navigator.pushNamed(context, HistoryOrder.id);
            },
          ),
        ],
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
                  '$namaMENU1',
                  style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Jumlah Pesanan : $_r",
                  style:
                  GoogleFonts.roboto(),
                ),
              ),
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: IconButton(
                    icon: IconMenu(
                      gambarIcon: Icons.remove,
                      warnaIcon: Colors.black,
                      sizeIcon: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _r--;
                        if(_r < 0){
                          _r = 0;
                        }
                        jumlahPESANAN1 = jumlahPESANAN1 - 1;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '$_r',
                    style: TextStyle(
                        fontSize: 22.0
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: IconButton(
                    icon: IconMenu(
                      gambarIcon: Icons.add,
                      warnaIcon: Colors.black,
                      sizeIcon: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _r++;
                        jumlahPESANAN1 = jumlahPESANAN1 + 1;
                      });
                    },
                  ),
                ),
              ],
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
                  '$namaMENU2',
                  style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Jumlah Pesanan : $_a",
                  style:
                  GoogleFonts.roboto(),
                ),
              ),
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: IconButton(
                    icon:IconMenu(
                      gambarIcon: Icons.remove,
                      warnaIcon: Colors.black,
                      sizeIcon: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _a--;
                        if(_a < 0){
                          _a = 0;
                        }
                        jumlahPESANAN2 = jumlahPESANAN2 - 1;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '$_a',
                    style: TextStyle(
                        fontSize: 22.0
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: IconButton(
                    icon: IconMenu(
                      gambarIcon: Icons.add,
                      warnaIcon: Colors.black,
                      sizeIcon: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _a++;
                        jumlahPESANAN2 = jumlahPESANAN2 + 1;
                      });
                    },
                  ),
                ),
              ],
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
                  '$namaMENU3',
                  style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Jumlah Pesanan : $_t",
                  style:
                  GoogleFonts.roboto(),
                ),
              ),
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: IconButton(
                      icon: IconMenu(
                        gambarIcon: Icons.remove,
                        warnaIcon: Colors.black,
                        sizeIcon: 22,
                      ),
                      onPressed: (){
                        setState(() {
                          _t--;
                          if(_t < 0){
                            _t = 0;
                          }
                          jumlahPESANAN3 = jumlahPESANAN3 - 1;
                        });
                      },
                    )
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '$_t',
                    style: TextStyle(
                        fontSize: 22.0
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: IconButton(
                    icon: IconMenu(
                      gambarIcon: Icons.add,
                      warnaIcon: Colors.black,
                      sizeIcon: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _t++;
                        jumlahPESANAN3 = jumlahPESANAN3 + 1;
                      });
                    },
                  ),
                ),
              ],
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
                  '$namaMENU4',
                  style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Jumlah Pesanan : $_m",
                  style:
                  GoogleFonts.roboto(),
                ),
              ),
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: IconButton(
                      icon: IconMenu(
                        gambarIcon: Icons.remove,
                        warnaIcon: Colors.black,
                        sizeIcon: 22,
                      ),
                      onPressed: (){
                        setState(() {
                          _m--;
                          if(_m < 0){
                            _m = 0;
                          }
                          jumlahPESANAN4 = jumlahPESANAN4 - 1;
                        });
                      },
                    )
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '$_m',
                    style: TextStyle(
                        fontSize: 22.0
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: IconButton(
                    icon: IconMenu(
                      gambarIcon: Icons.add,
                      warnaIcon: Colors.black,
                      sizeIcon: 17,
                    ),
                    onPressed: () {
                      setState(() {
                        _m++;
                        jumlahPESANAN4 = jumlahPESANAN4 + 1;
                      });
                    },
                  ),
                ),
              ],
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
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent),
                  ),
                  child: Text(
                    'Total',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 18,
                    ),
                  ),
                  onPressed: (){
                    setState(() {
                      sum = 0;
                      sum = sum + ((_r*16000)+(_a*14000)+(_t*7000)+(_m*13000));
                      totalHARGA = sum;
                    });
                  },
                ),

                Text(
                  'Total : $totalHARGA',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.check,
        ),
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () async{
          var loggedInUser = FirebaseAuth.instance.currentUser;
          await firestoreInstance
              .collection('order')
              .doc(loggedInUser.email)
              .set({
            'namamenu1': '$namaMENU1',
            'jumlahpesanan1': '$jumlahPESANAN1',
            'namamenu2': '$namaMENU2',
            'jumlahpesanan2': '$jumlahPESANAN2',
            'namamenu3': '$namaMENU3',
            'jumlahpesanan3': '$jumlahPESANAN3',
            'namamenu4': '$namaMENU4',
            'jumlahpesanan4': '$jumlahPESANAN4',
            'totalharga': '$totalHARGA',
          })
              .then((value) => print(
              '${loggedInUser.displayName} berhasil menambahkan order'))
              .catchError(
                  (error) => print('Gagal menambahkan moods ke database'));

        },
      ),
    );
  }
}

class IconMenu extends StatelessWidget{
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
