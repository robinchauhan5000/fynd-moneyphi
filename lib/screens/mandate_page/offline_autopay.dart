import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:moneyphi/widgets/moneyPhiButton.dart';
import 'package:provider/provider.dart';

import '../../controller/check_out_controller.dart';
import '../payment/PaymentScreen.dart';
import 'account_details.dart';

class OfflineAutopay extends StatefulWidget {
  @override
  State<OfflineAutopay> createState() => _OfflineAutopayState();
}

class _OfflineAutopayState extends State<OfflineAutopay> {
  int? selectedAmount = 50000;

  List<bool> amountValueBool = [false, false, true, false];

  GetBankDetailsController? getBankDetailsController;
  @override
  void initState() {
    getBankDetailsController =
        Provider.of<GetBankDetailsController>(context, listen: false);
    getBankDetailsController!.getBankDetails(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          TextButton(
            onPressed: () {},
            child: Text(
              "Learn More About Autopay",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Your Bank Details",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<GetBankDetailsController>(
                    builder: (context, controller, child) {
                  return controller.isLoading == true
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount:
                              controller.getBankDetailsModel!.banksData.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return AccountDetails(
                                bankData: controller
                                    .getBankDetailsModel!.banksData
                                    .elementAt(index));
                          },
                        );
                }),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),

                          // Image.network("https://1000logos.net/wp-content/uploads/2021/06/HDFC-Bank-emblem.png",height:70,width: 70,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Minimum Auto Debit Limit"),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blue,
                                  child: Icon(
                                    Icons.question_mark,
                                    color: Colors.white,
                                    size: 18,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              ' $selectedAmount',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      amountValueBool[0] = true;
                                      amountValueBool[1] = false;
                                      amountValueBool[2] = false;
                                      amountValueBool[3] = false;
                                      selectedAmount = 10000;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: amountValueBool[0]
                                            ? appColorPrimary
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: appColorPrimary)),
                                    child: Text(
                                      "₹ 10000",
                                      style: TextStyle(
                                          fontWeight: amountValueBool[0]
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: amountValueBool[0]
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      amountValueBool[0] = false;
                                      amountValueBool[1] = true;
                                      amountValueBool[2] = false;
                                      amountValueBool[3] = false;
                                      selectedAmount = 25000;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: amountValueBool[1]
                                            ? appColorPrimary
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: appColorPrimary)),
                                    child: Text(
                                      "₹ 25000",
                                      style: TextStyle(
                                          fontWeight: amountValueBool[1]
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: amountValueBool[1]
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      amountValueBool[0] = false;
                                      amountValueBool[1] = false;
                                      amountValueBool[2] = true;
                                      amountValueBool[3] = false;
                                      selectedAmount = 50000;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: amountValueBool[2]
                                            ? appColorPrimary
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: appColorPrimary)),
                                    child: Text(
                                      "₹ 50000",
                                      style: TextStyle(
                                          fontWeight: amountValueBool[2]
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: amountValueBool[2]
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      amountValueBool[0] = false;
                                      amountValueBool[1] = false;
                                      amountValueBool[2] = false;
                                      amountValueBool[3] = true;
                                      selectedAmount = 100000;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        color: amountValueBool[3]
                                            ? appColorPrimary
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: appColorPrimary)),
                                    child: Text(
                                      "₹ 100000",
                                      style: TextStyle(
                                          fontWeight: amountValueBool[3]
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: amountValueBool[3]
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.download,
                            color: Colors.blue,
                          ),
                          Text("Download")
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          Text("Email")
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.view_list_outlined,
                            color: Colors.blue,
                          ),
                          Text("View")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MoneyPhiButton(
          buttonTitle: "Create AutoPay",
          onClick: () async {
            if (getBankDetailsController
                    ?.getBankDetailsModel?.mandatesData.length ==
                0) {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                context: context,
                builder: (_) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.white),
                    height: SizeConfig.screenHeight * 0.6,
                    padding: EdgeInsets.zero,
                    child: Consumer<GetBankDetailsController>(
                        builder: (context, controller, child) {
                      return Column(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.clear))),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.isOfflineMandateLoading
                                    ? CircularProgressIndicator()
                                    : controller.statusOfCheckBox
                                        ? Lottie.asset(
                                            "assets/animation/mandate.json")
                                        : Icon(
                                            Icons.clear,
                                            color: Colors.red,
                                            size: 40,
                                          ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Mandate id created successfully"),
                                SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentScreen()));
                                    },
                                    child: Text("Okay"))
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  );
                },
              );

              getBankDetailsController?.offlineCreateMandate(
                  context, selectedAmount);
            } else if (getBankDetailsController!
                    .getBankDetailsModel!.mandatesData.length >
                0) {
              getBankDetailsController!.getBankDetailsModel!.mandatesData
                  .forEach((element) {
                if (element.status.contains("PENDING") ||
                    element.status.contains("APPROVED")) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()));
                } else {
                  return;
                }
              });
            }
          }),
    );
  }
}
