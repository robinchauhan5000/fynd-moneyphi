import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:moneyphi/widgets/money_button.dart';
import 'package:provider/provider.dart';

import '../../Model/GetCartListModel.dart';
import '../../controller/check_out_controller.dart';
import '../payment/PaymentScreen.dart';
import 'account_details.dart';
import 'offline_autopay.dart';

class MandatePage extends StatefulWidget {
  Goal? fund;
  MandatePage({this.fund});
  @override
  State<MandatePage> createState() => _MandatePageState();
}

class _MandatePageState extends State<MandatePage> {
  GetBankDetailsController? getBankDetailsController;
  var coun = 0;
  verifyMandate() {
    if (getBankDetailsController!.getBankDetailsModel!.mandatesData.length >
        0) {
      getBankDetailsController!.getBankDetailsModel!.mandatesData
          .forEach((element) {
        if (element.status.contains("PENDING") ||
            element.status.contains("APPROVED")) {
          coun = coun + 1;

          if (coun == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentScreen()));
          }
          return;
        } else {
          return;
        }
      });
    }
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 200), () {
      getBankDetailsController =
          Provider.of<GetBankDetailsController>(context, listen: false);
      getBankDetailsController!.getBankDetails(context);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => PaymentScreen()));
    });
    super.initState();
  }

  int? selectedAmount = 50000;

  List<bool> amountValueBool = [false, false, true, false];
  void showDialogWithFields() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Contact Us'),
          content: Container(
            height: SizeConfig.screenHeight * 0.6,
            child: Column(
              children: [
                Text(
                    "Example : You decide to invest ₹ 10,000 every month in mutual funds via SIP."),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "You set auto-debit limit as ₹ 1,00,000. Every month only your choosen SIP amount ₹10,000 gets debited from your bank account."),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Now in future if you want to increase your SIP from your same bank account.No new mandate has to be created or no new process of mandate apporval has to be done if your SIP amount is upto your approved mandate limit."),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Set Up Your Autopay",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.8,
                      child: Text(
                        "Clickpay (mandate) will automate your investments from your registered bank account.",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          showDialogWithFields();
                        },
                        child: Text("Learn more")),
                  ],
                ),
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
                            verifyMandate();
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
                            height: 40,
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
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "Dont have access to online banking?",
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'To Create offline Autopay ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).textTheme.headline3!.color),
                    ),
                    TextButton(
                      child: Text(
                        "Click Here",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OfflineAutopay()));
                      },
                    ),
                  ],
                ),
                Text(
                  "(This will take upto 30 days to approve and start your SIP)",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Consumer<GetBankDetailsController>(
          builder: (context, controller, child) {
        return MoneyButton(
          textWidet: controller.isLoading
              ? CircularProgressIndicator()
              : Text(
                  "Create AutoPay",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
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
                          controller.statusOfCheckBox
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.clear)))
                              : Container(),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.isOfflineMandateLoading
                                    ? CircularProgressIndicator()
                                    : controller.statusOfCheckBox
                                        ? Lottie.asset(
                                            "assets/animation/mandate.json",
                                            height:
                                                SizeConfig.screenHeight * 0.3,
                                            width: 100)
                                        : Icon(
                                            Icons.clear,
                                            color: Colors.red,
                                            size: 40,
                                          ),
                                SizedBox(
                                  width: 10,
                                ),
                                controller.statusOfCheckBox
                                    ? Text("Mandate id is created successfully")
                                    : Text(
                                        "Sorry, We are not able to create Mandate Id"),
                                SizedBox(
                                  height: 30,
                                ),
                                controller.statusOfCheckBox
                                    ? ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PaymentScreen(
                                                          fund: widget.fund)));
                                        },
                                        child: Text("Proceed"))
                                    : Container()
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  );
                },
              );

              getBankDetailsController?.onlinecreateMandate(
                  context, selectedAmount);
            } else if (getBankDetailsController!
                    .getBankDetailsModel!.mandatesData.length >
                0) {
              var coun = 0;
              getBankDetailsController!.getBankDetailsModel!.mandatesData
                  .forEach((element) {
                if (element.status.contains("PENDING") ||
                    element.status.contains("APPROVED")) {
                  coun = coun + 1;
                  setState(() {});
                }
              });
              if (coun >= 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()));
              }
              // else {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => MandatePage()));
              // }
            }

            // var data=await  getBankDetailsController!.getMandate(context);
            // if(data==true){}
            // else{
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>OfflineAutopay()));
            // }
          },
        );
      }),
    );
  }
}
// Navigator.push(context,
// MaterialPageRoute(builder: (context) => OfflineAutopay()));
