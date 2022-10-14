import 'package:flutter/material.dart';
import 'package:moneyphi/controller/PaymentController.dart';
import 'package:moneyphi/theme/theme.dart';
import 'package:moneyphi/utils/SharedPref.dart';
import 'package:moneyphi/widgets/money_button.dart';
import 'package:provider/provider.dart';

import '../../Model/GetCartListModel.dart';
import '../../Model/RegisterSipModel.dart';
import '../../controller/MutualFundsController.dart';
import '../../controller/check_out_controller.dart';
import '../mandate_page/account_details.dart';
import 'BankTransit.dart';

enum PaymentMethods { upi, netBanking, mandate }

class PaymentScreen extends StatefulWidget {
  Goal? fund;

  PaymentScreen({Key? key, this.fund}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethods? paymentMethods = PaymentMethods.upi;
  TextEditingController pass = TextEditingController();
  RegisterSipModel? paymentModel;
  MutualFundsController? mutualFundsController;
  PaymentController? paymentController;
  GetBankDetailsController? getBankDetailsController;
  // MutualFundsController? mutualFundsController;
  //
  var cartData;
  //
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(milliseconds: 200), () {

    mutualFundsController =
        Provider.of<MutualFundsController>(context, listen: false);
    paymentController = Provider.of<PaymentController>(context, listen: false);
    getBankDetailsController =
        Provider.of<GetBankDetailsController>(context, listen: false);
    getBankDetailsController!.getBankDetails(context);
    cartData = mutualFundsController!.getCartListModel;
    // });
    print(
        "getBankDetailsController!.getBankDetailsModel!.mandatesData[0].bseMandateId");
    print(getBankDetailsController!.getBankDetailsModel!.mandatesData.length);

    // print(getBankDetailsController!
    //     .getBankDetailsModel!.mandatesData[0].bseMandateId);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
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
                            bankData: controller.getBankDetailsModel!.banksData
                                .elementAt(index));
                      },
                    );
            }),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [mainboxshadow],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("UPI"),
                      Radio<PaymentMethods>(
                        fillColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        value: PaymentMethods.upi,
                        groupValue: paymentMethods,
                        onChanged: (PaymentMethods? value) {
                          setState(() {
                            paymentMethods = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Net Banking"),
                      Radio<PaymentMethods>(
                        fillColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        value: PaymentMethods.netBanking,
                        groupValue: paymentMethods,
                        onChanged: (PaymentMethods? value) {
                          setState(() {
                            paymentMethods = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Mandate"),
                      Radio<PaymentMethods>(
                        fillColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        value: PaymentMethods.mandate,
                        groupValue: paymentMethods,
                        onChanged: (PaymentMethods? value) {
                          setState(() {
                            paymentMethods = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (paymentMethods == PaymentMethods.upi)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'It Can\'t be empty';
                        }
                        if (text.length < 4) {
                          return 'Too short';
                        }
                        return null;
                      },
                      controller: pass,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white70,
                        border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "abc@upi",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Use the UPI ID linked with the above selected bank only or else your payment will fail.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
          ],
        ),
        floatingActionButton: MoneyButton(
            onClick: () async {
              var date = await SharedPref().getString(key: "id");
              setState(() {});
              List<int> ids = [];
              List<FundDatum>? fundData = [];
              bool value = false;

              var res = await paymentController?.registerSIP(
                  context: context,
                  methodOfPay: paymentMethods == PaymentMethods.upi
                      ? "UPI"
                      : "netBanking",
                  mandateID: getBankDetailsController!
                      .getBankDetailsModel!.mandatesData[0].bseMandateId
                  // getBankDetailsC ontroller!.getBankDetailsModel!.mandatesData[i].bseMandateId
                  );
              print("Out res");
              print(res);
              if (res!.statusCode == 200) {
                print("res");
                print(res);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BankTransit(
                              htmlData: (res.data.toString()),
                            )));
              }

              // for (int i = 0;
              //     i <
              //         getBankDetailsController!
              //             .getBankDetailsModel!.mandatesData.length;
              //     i++) {
              //   if (DateTime.now().compareTo(getBankDetailsController!
              //           .getBankDetailsModel!.mandatesData[i].endDate) <
              //       0) {
              //
              //     setState(() {
              //       value = true;
              //     });
              //   }
              // }

              // for (int i = 0;
              //     i < mutualFundsController!.getCartListModel!.cart!.goals.length;
              //     i++) {
              //   ids.add(mutualFundsController!
              //       .getCartListModel!.cart!.goals[i].goalId);
              //   for (int j = 0;
              //       j <
              //           mutualFundsController!
              //               .getCartListModel!.cart!.goals[i].funds.length;
              //       j++) {
              //     var dates = await SharedPref().getString(
              //       key:
              //           "id${mutualFundsController!.getCartListModel!.cart!.goals[i].funds[j].fundId}",
              //     );
              //     fundData.add(FundDatum(
              //         fundBseCode: mutualFundsController!
              //             .getCartListModel!.cart!.goals[i].funds[j].fundBseCode,
              //         startDate: startDate,
              //         frequency: frequency,
              //         amount: mutualFundsController!
              //             .getCartListModel!.cart!.goals[i].funds[j].amount,
              //         noOfInstallments: noOfInstallments,
              //         fundId: mutualFundsController!
              //             .getCartListModel!.cart!.goals[i].funds[j].fundId,
              //         sipDate: dates!,
              //         selectedFolio: "",
              //         mandateId: mutualFundsController!
              //             .getCartListModel!.cart!.goals[i].funds));
              //   }
              // }
              // paymentModel = RegisterSipModel(
              //     sips: Sips(
              //         userGoalInputIds: ids,
              //         firstOrderFlag: 'true',
              //         mandateType: '',
              //         fundData: []));

              // Navigator.push(context, MaterialPageRoute(builder: (context)=> ));
            },
            textWidet: Text(
              "Pay Now",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
