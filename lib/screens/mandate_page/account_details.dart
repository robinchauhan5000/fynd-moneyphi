import 'package:flutter/material.dart';
import 'package:moneyphi/theme/theme.dart';
import 'package:moneyphi/utils/SizeConfig.dart';

import '../../Model/BankDetailsModel.dart';

class AccountDetails extends StatefulWidget {
  BanksDatum? bankData;
  AccountDetails({this.bankData});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [mainboxshadow],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "https://1000logos.net/wp-content/uploads/2021/06/HDFC-Bank-emblem.png",
                  alignment: Alignment.topLeft,
                  height: 70,
                  width: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text("${widget.bankData!.bankName}"),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        "A/c:xxxxxxxxxxxxxx${widget.bankData!.accNumber.substring(widget.bankData!.accNumber.length - 4, widget.bankData!.accNumber.length)}"),
                    SizedBox(
                      height: 10,
                    ),
                    widget.bankData!.netBanking
                        ? Container(
                            width: SizeConfig.screenWidth * 0.7,
                            child: Text(
                              "Your bank supports electronic autopay.No paper work required.",
                              style: TextStyle(
                                  color: Color(0xffEF8C18),
                                  fontWeight: FontWeight.w900),
                            ),
                          )
                        : Text(""),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
