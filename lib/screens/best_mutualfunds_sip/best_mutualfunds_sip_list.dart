import 'package:flutter/material.dart';
import 'package:moneyphi/screens/funds_details_screen/funds_detailed_screen.dart';
import 'package:moneyphi/widgets/funds_page_tile.dart';

class BestMutualFundsSipList extends StatelessWidget {
  const BestMutualFundsSipList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Best SIP Funds',
          style: TextStyle(
            color: Theme.of(context).textTheme.headline3?.color,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Theme.of(context).textTheme.headline3?.color,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FundsDetailedScreen()));
                    },
                    child: FundsPageTile()),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FundsDetailedScreen()));
                    },
                    child: FundsPageTile()),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FundsDetailedScreen()));
                    },
                    child: FundsPageTile()),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FundsDetailedScreen()));
                    },
                    child: FundsPageTile()),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FundsDetailedScreen()));
                    },
                    child: FundsPageTile()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
