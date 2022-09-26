import 'package:flutter/material.dart';
import 'package:moneyphi/controller/MutualFundsController.dart';
import 'package:moneyphi/controller/dashBoardController.dart';
import 'package:moneyphi/screens/kycFoms/bscPersonalDetails.dart';
import 'package:moneyphi/screens/kycFoms/panCardFormScreen.dart';
import 'package:moneyphi/theme/theme.dart';
import 'package:moneyphi/utils/AppSnackBar.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../Model/GetCartListModel.dart';
import '../payment/PaymentScreen.dart';
import 'cart_pageTile.dart';

class CartPageList extends StatefulWidget {
  const CartPageList({Key? key}) : super(key: key);
  @override
  State<CartPageList> createState() => _CartPageListState();
}

class _CartPageListState extends State<CartPageList> {
  MutualFundsController? mutualFundsController;
  DashBoardController? dashBoardController;
  Fund? fundModel;

  @override
  void initState() {
    mutualFundsController =
        Provider.of<MutualFundsController>(context, listen: false);
    dashBoardController =
        Provider.of<DashBoardController>(context, listen: false);
    Future.delayed(Duration(milliseconds: 100),
        () => {mutualFundsController!.getCartList(context)});
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
      ),
      body: Container(
        height: SizeConfig.screenHeight * 0.8,
        child: SingleChildScrollView(
          child: Consumer<MutualFundsController>(
              builder: (context, controller, child) {
            return controller.isLoading
                ? Column(
                    children: [
                      Center(child: CircularProgressIndicator()),
                    ],
                  )
                : controller.getCartListModel == null
                    ? Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.remove_shopping_cart,
                              size: 50,
                            ),
                            Text("There is no item in the cart"),
                          ],
                        ),
                      )
                    : controller.getCartListModel?.cart == null
                        ? Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.remove_shopping_cart,
                                  size: 50,
                                ),
                                Text("There is no item in the cart"),
                              ],
                            ),
                          )
                        : Container(
                            child: Column(
                              children: [
                                for (int i = 0;
                                    i <
                                        controller.getCartListModel!.cart!.goals
                                            .length;
                                    i++)
                                  ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: controller.getCartListModel
                                          ?.cart!.goals[i].funds.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             MandatePage(
                                            //                 fund: controller
                                            //                     .getCartListModel
                                            //                     ?.cart!
                                            //                     .goals[i])));
                                          },
                                          child: CartPageTile(
                                              folioNumber: controller
                                                  .getCartListModel
                                                  ?.cart
                                                  ?.uniqueFunds
                                                  .sips[i]
                                                  .sipDates,
                                              inputiD: controller
                                                  .getCartListModel
                                                  ?.cart!
                                                  .goals[i]
                                                  .inputId,
                                              fundshipId: controller
                                                  .getCartListModel
                                                  ?.cart!
                                                  .goals[i]
                                                  .funds[index]
                                                  .fundId,
                                              fundshipName: controller
                                                  .getCartListModel
                                                  ?.cart!
                                                  .goals[i]
                                                  .funds[index]
                                                  .fundName,
                                              sipAmount: controller
                                                  .getCartListModel
                                                  ?.cart!
                                                  .goals[i]
                                                  .funds[index]
                                                  .amount
                                                  .toString(),
                                              userInputId: controller
                                                  .getCartListModel!
                                                  .cart!
                                                  .goals[i]
                                                  .inputId,
                                              sipDates: controller.getCartListModel!.cart!.goals[i].funds
                                                  .elementAt(index)
                                                  .sipDates,
                                              itemIndex: i,
                                              investmentType: controller.getCartListModel!.cart!.goals[i].funds.elementAt(index).investmentType),
                                        );
                                      }),
                                SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 20)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              primaryColor)),
                                  child: Text(
                                    'Place Order',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    print(controller.sipDateAdded.length);
                                    if (controller.sipDateAdded.length !=
                                        controller.getCartListModel?.cart!.goals
                                            .length) {
                                      appSnackBar(
                                          content: "Please Add Sip dates",
                                          context: context);
                                    } else {
                                      if (dashBoardController
                                              ?.getProfileModel?.isKycDone ==
                                          0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PanCardFormScreen()));
                                      } else if (dashBoardController
                                                  ?.getProfileModel
                                                  ?.isBseClientCreated !=
                                              1 &&
                                          dashBoardController?.getProfileModel
                                                  ?.completedPart !=
                                              "2-5 ") {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BSCPersonDetails()));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PaymentScreen()));
                                      }
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                    'By continuing, I agree with the Disclaimers and T&C.',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
          }),
        ),
      ),
      // floatingActionButton: Container(
      //   margin: EdgeInsets.only(bottom: 30),
      //   child: ElevatedButton(
      //     style: ButtonStyle(
      //         padding: MaterialStateProperty.all(
      //             EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
      //         backgroundColor: MaterialStateProperty.all(primaryColor)),
      //     child: Text(
      //       'Place Order',
      //       style: TextStyle(fontSize: 18),
      //     ),
      //     onPressed: () {},
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
