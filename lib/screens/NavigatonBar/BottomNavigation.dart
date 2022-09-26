import "package:flutter/material.dart";
import 'package:moneyphi/screens/dashboard/dashboard.dart';
import 'package:moneyphi/screens/explorer_screen/explorer_screen.dart';
import 'package:moneyphi/screens/order_status/order_list.dart';
import 'package:moneyphi/screens/portfolio/portfolio_main_screen.dart';
import 'package:moneyphi/utils/Colors.dart';

import '../mandate_page/offline_autopay.dart';

class BottomNavBarV2 extends StatefulWidget {
  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
      print(currentIndex);
    });
  }

  var holder = [
    DashboardScreen(),
    // SignatureScreen(),
    OrderList(),
    Portfolio(),
    OfflineAutopay()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(55),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 8,
                offset: Offset(0, 5), // changes position of shadow
              )
            ],
            shape: BoxShape.circle),
        height: MediaQuery.of(context).size.height * 0.11,
        width: MediaQuery.of(context).size.width * 0.2,
        child: FloatingActionButton(
            backgroundColor: (appColorPrimary),
            child: Image.asset(
              "assets/mp_logo.png",
              scale: 1.3,
            ),
            elevation: 0.1,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExplorerScreen()));
            }),
      ),
      body: Stack(
        children: [
          holder[currentIndex],
          Positioned(
            bottom: 0,
            left: 0,
            child: BottomAppBar(
                //color: Colors.white,
                shape: const CircularNotchedRectangle(),
                notchMargin: 5,
                child: Container(
                  height: 60,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 8,
                        offset: Offset(0, 5), // changes position of shadow
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.home,
                          color: currentIndex == 0
                              ? appColorPrimary
                              : Colors.grey.shade400,
                        ),
                        onPressed: () {
                          setBottomBarIndex(0);
                        },
                        splashColor: Colors.white,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.restaurant_menu,
                            color: currentIndex == 1
                                ? appColorPrimary
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(1);
                          }),
                      Container(
                        width: size.width * 0.2,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.bookmark,
                            color: currentIndex == 2
                                ? appColorPrimary
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: currentIndex == 3
                                ? appColorPrimary
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(3);
                          }),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
