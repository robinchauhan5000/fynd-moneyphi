import 'package:flutter/material.dart';
import 'package:moneyphi/screens/profile/profile_notification/read_notification.dart';
import 'package:moneyphi/screens/profile/profile_notification/unread_notifcation.dart';

class PortfolioNotifications extends StatefulWidget {
  const PortfolioNotifications({Key? key}) : super(key: key);

  @override
  State<PortfolioNotifications> createState() => _PortfolioNotificationsState();
}

class _PortfolioNotificationsState extends State<PortfolioNotifications>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(_tabController?.index);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextButton(
            onPressed: () {},
            child: const Text(
              'back',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.orangeAccent,
            tabs: <Widget>[
              Tab(
                child: Card(
                  color: Colors.transparent,
                  elevation: 15,
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green
                        // color: _tabController?.index != null
                        //     ? Colors.green
                        //     : Colors.orange
                        ),
                    child: const Center(
                      child: Text(
                        'Unread',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Tab(
                child: Card(
                  color: Colors.transparent,
                  elevation: 15,
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green
                        // color: _tabController?.index != null
                        //     ? Colors.green
                        //     : Colors.orange
                        ),
                    child: const Center(
                      child: Text(
                        'All',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),

              // const Tab(
              //   icon: Icon(Icons.beach_access_sharp),
              // ),
              // Tab(
              //   icon: Icon(Icons.brightness_5_sharp),
              // ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ReadNotification(),
            UnreadNotification(),

            // Center(
            //   child: Text("It's sunny here"),
            // ),
          ],
        ),
      ),
    );
  }
}
