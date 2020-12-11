import 'package:UTS/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:UTS/checkout.dart';

class MainMenu extends StatefulWidget{
  static const String id = 'menu';

  @override
  _MainMenu createState() => _MainMenu();
}

class _MainMenu extends State<MainMenu> {

  Future<bool> _onBackPressed(){
    return showDialog(
      context: context,
      builder: (BuildContext context)=>AlertDialog(
        title: Text(
            "Do you really want to exit the app?"
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
                "No"
            ),
            onPressed: () => Navigator.pop(context,false),
          ),
          FlatButton(
            child: Text(
                "Yes"
            ),
            onPressed: () => SystemNavigator.pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return DefaultTabController(
      length: 2,
      child: WillPopScope(
        onWillPop: () async => _onBackPressed(),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.amber,

          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            centerTitle: true,

            title: Text(
              'Menu Dapoerkoe',
              style:
              GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.bold,
                  fontSize: 26
              ),
            ),

            actions: <Widget>[
              IconButton(
                icon:IconMenu(
                  gambarIcon: Icons.account_circle_rounded,
                  warnaIcon: Colors.white,
                ),
                onPressed: (){
                  Navigator.pushNamed(context, HalamanProfile.id);
                },
              ),
            ],
          ),

          body: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  elevation: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network('https://cdn2.tstatic.net/palu/foto/bank/images/berikut-resep-membuat-daging-rendang.jpg',
                        height: 150.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                      ),

                      SizedBox(
                        height: 3.0,
                      ),

                      Padding(
                        padding: EdgeInsets.all(mediaQuery.viewInsets.bottom),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                    "Rendang",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                      color: Colors.black,
                                    )
                                ),
                                Text(
                                    "Rp. 16.000",
                                    style: GoogleFonts.roboto(
                                      fontSize: 8.0,
                                      color: Colors.black,
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  elevation: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('assets/img/mie goreng.jpg',
                        height: 150.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                      ),

                      SizedBox(
                        height: 3.0,
                      ),

                      Padding(
                        padding: EdgeInsets.all(mediaQuery.viewInsets.bottom),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                    "Mie Goreng",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                      color: Colors.black,
                                    )
                                ),
                                Text(
                                    "Rp. 13.000",
                                    style: GoogleFonts.roboto(
                                      fontSize: 8.0,
                                      color: Colors.black,
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  elevation: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('assets/img/Ayam pop.jpg',
                        height: 150.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                      ),

                      SizedBox(
                        height: 3.0,
                      ),

                      Padding(
                        padding: EdgeInsets.all(mediaQuery.viewInsets.bottom),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                    "Ayam Pop",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                      color: Colors.black,
                                    )
                                ),
                                Text(
                                    "Rp. 14.000",
                                    style: GoogleFonts.roboto(
                                      fontSize: 8.0,
                                      color: Colors.black,
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)
                  ),
                  elevation: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('assets/img/telor balado.jpg',
                        height: 150.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                      ),

                      SizedBox(
                        height: 3.0,
                      ),

                      Padding(
                        padding: EdgeInsets.all(mediaQuery.viewInsets.bottom),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                    "Telur Balado",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                      color: Colors.black,
                                    )
                                ),
                                Text(
                                    "Rp. 7.000",
                                    style: GoogleFonts.roboto(
                                      fontSize: 8.0,
                                      color: Colors.black,
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrangeAccent,
            onPressed: () {
              Navigator.pushReplacementNamed(context, CheckOut.id);
            },
            child: IconMenu(gambarIcon: Icons.shopping_cart, warnaIcon: Colors.white,),
          ),
        ),
      ),
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