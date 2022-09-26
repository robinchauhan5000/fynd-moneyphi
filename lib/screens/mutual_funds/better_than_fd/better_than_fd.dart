import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/screens/funds_details_screen/funds_detailed_screen.dart';
import 'package:moneyphi/theme/theme.dart';
import 'package:moneyphi/utils/SizeConfig.dart';

import '../../../widgets/funds_page_tile.dart';

class BetterThanFD extends StatelessWidget {
  const BetterThanFD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Theme.of(context).textTheme.headline3?.color,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: [
          Tooltip(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
              child: Text('?'),
            ),
            message: "Click here",
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [mainboxshadow],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons8-garden-96 1.png',
                          width: 100,
                        ),
                        Text(
                          AppLocalizations.of(context)!.betterthanFD,
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 6,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color(0xff3DE08B).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text('Stable Returns'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color(0xff3DE08B).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text('Low-medium risk funds'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color(0xff3DE08B).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                                'Indexation benefit if held for more than 3 years'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FundsDetailedScreen()),
                      );
                    },
                    child: FundsPageTile(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FundsDetailedScreen()),
                      );
                    },
                    child: FundsPageTile(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FundsDetailedScreen()),
                      );
                    },
                    child: FundsPageTile(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FundsDetailedScreen()),
                      );
                    },
                    child: FundsPageTile(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FundsDetailedScreen()),
                      );
                    },
                    child: FundsPageTile(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xffC4C4C4), borderRadius: BorderRadius.circular(10)),
        child: Icon(
          Icons.filter_alt_sharp,
          color: Colors.blue,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
