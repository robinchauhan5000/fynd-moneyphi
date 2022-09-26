import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';

import '../theme/theme.dart';

class FundsPageTile extends StatelessWidget {
  String? fundsipName;
  String? minSip;
  String? duration;
  String? nav;
  FundsPageTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [mainboxshadow],
      ),
      child: Container(
        height: SizeConfig.blockSizeVertical * 15,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/globalfund.png', height: 30),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ICICI PRudential Emerging Blue Chip',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.headline3!.color),
                    ),
                    Text(
                      'Equity | Large cap',
                      style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .headline3!
                              .color!
                              .withOpacity(0.4)),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NAV',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.headline3!.color),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '170.7865',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline3!.color),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3yrs',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.headline3!.color),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '18.75%',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline3!.color),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Min SIP',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.headline3!.color),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${rupeeSymbol}100',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline3!.color),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Invest now',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
