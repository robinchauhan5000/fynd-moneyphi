import 'package:flutter/material.dart';
import 'package:moneyphi/Model/MutualFundModel.dart';
import 'package:provider/provider.dart';

import '../../controller/MutualFundsController.dart';
import '../funds_details_screen/funds_detailed_screen.dart';

class FundShipTile extends StatelessWidget {
  String? fundshipName;
  String? minSip;
  String? duration;
  String? nav;
  final int? id;
  final int? watchlistid;
  final Fund? model;

  int? index;
  FundShipTile(
      {this.duration,
      this.id,
      this.fundshipName,
      this.index,
      this.minSip,
      this.nav,
      this.model,
      this.watchlistid});

  @override
  Widget build(BuildContext context) {
    var mutualFundsController =
        Provider.of<MutualFundsController>(context, listen: false);

    return Consumer<MutualFundsController>(
        builder: (context, controller, child) {
      return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 8,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fundshipName!),
              Text(
                "Equity| Large Cap",
                style: TextStyle(color: Colors.grey, fontSize: 8),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite,
                        color: watchlistid == null ? Colors.black : Colors.red,
                        size: 20),
                    onPressed: () {
                      mutualFundsController.addToWatchList(context, id!, index);
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        "NAV",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        nav!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        duration!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "18.75%",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Min.SIP",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        minSip!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FundsDetailedScreen(
                            model: model,
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                          border: Border.all(color: Colors.green)),
                      child: Text(
                        "Invest Now",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
