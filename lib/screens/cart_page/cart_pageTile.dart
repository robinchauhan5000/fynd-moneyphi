import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/controller/MutualFundsController.dart';
import 'package:moneyphi/theme/theme.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../cart/cart_date_alertbox.dart';

class CartPageTile extends StatelessWidget {
  String? fundshipName;
  String? minSip;
  String? duration;
  String? sipAmount;
  int? itemIndex;
  int? userInputId;
  List<int>? sipDates;
  String? investmentType;
  int? fundshipId;
  List<int>? folioNumber;

  int? inputiD;
  CartPageTile(
      {this.itemIndex,
      this.duration,
      this.fundshipName,
      this.minSip,
      this.sipDates,
      this.userInputId,
      this.sipAmount,
      this.inputiD,
      this.investmentType,
      this.fundshipId,
      this.folioNumber});

  @override
  Widget build(BuildContext context) {
    MutualFundsController mutualFundsController =
        Provider.of<MutualFundsController>(context, listen: false);
    return Consumer<MutualFundsController>(
        builder: (context, controller, child) {
      return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [mainboxshadow],
        ),
        child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth / fundshipName!.length * 20,
                    child: Text(
                      fundshipName!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.5),
                    ),
                  ),
                  Spacer(),
                  // DropdownButton<String>(
                  //   alignment: Alignment.centerLeft,
                  //   icon: Icon(Icons.more_vert),
                  //   items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (_) {},
                  // )

                  // IconButton(
                  //     onPressed: () => {showMemberMenu(context, folioNumber)},
                  //     icon: Icon(Icons.more_vert_rounded)),

                  PopupMenuButton<int>(
                      itemBuilder: (context) => folioNumber!
                          .map((e) => PopupMenuItem<int>(
                                value: e,
                                child: Text(
                                  e.toString(),
                                ),
                              ))
                          .toList(),
                      onSelected: (value) {
                        print(value);
                      },
                      child: Icon(Icons.more_vert)),

                  // PopupMenuButton<List<int>>(
                  //   offset: const Offset(0, -380),
                  //   initialValue: folioNumber,
                  //   itemBuilder: (
                  //     context,
                  //   ) =>
                  //       [
                  //     folioNumber.forEach((element) {
                  //       return PopupMenuItem<int>(
                  //           value: 0,
                  //           child: ListTile(
                  //             title: Text("A"),
                  //           ))
                  //     })
                  //   ],
                  //   child: Icon(
                  //     Icons.more_vert,
                  //   ),
                  // )
                ],
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SIP Amount",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Select SIP Date    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ " + sipAmount!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        investmentType == "SIP"
                            ? GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CartDateAlert(
                                          sipDates: sipDates,
                                          inputId: inputiD,
                                          fundshipId: fundshipId!);
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.blue,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.removeAddedToCart(
                                context: context,
                                usergoalinputId: userInputId,
                                index: itemIndex);
                          },
                          child: Icon(Icons.delete_outline_outlined),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  showMemberMenu(context, folioNumber) async {
    return await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(200, 150, 100, 100),
      items: List.generate(
        folioNumber.length,
        (index) => PopupMenuItem(
          onTap: () => {print(folioNumber[index])},
          value: 1,
          child: Text(
            folioNumber[index].toString(),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
      elevation: 8.0,
    ).then((value) {
      if (value != null) print(value);
    });
  }
  //
  // createPopMenuOption() {
  //   List<Widget> popList = [];
  //   for (int i = 0; i < folioNumber!.length; i++) {
  //     popList.add(
  //       PopupMenuItem<int>(
  //           value: 0,
  //           child: ListTile(
  //             title: Text(folioNumber),
  //           )),
  //     );
  //   }
  // }
}
