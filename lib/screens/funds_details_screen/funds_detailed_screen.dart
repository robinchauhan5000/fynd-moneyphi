import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:moneyphi/controller/MutualFundsController.dart';
import 'package:moneyphi/screens/cart_page/cart_page_list.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:provider/provider.dart';

import '../../Model/MutualFundModel.dart';
import '../../utils/SizeConfig.dart';

class FundsDetailedScreen extends StatefulWidget {
  Fund? model;

  FundsDetailedScreen({Key? key, this.model}) : super(key: key);

  @override
  State<FundsDetailedScreen> createState() => _FundsDetailedScreenState();
}

class _FundsDetailedScreenState extends State<FundsDetailedScreen> {
  List<bool> intallmentToggleValue = [true, false];
  List<bool> sipToggleValue = [true, false];
  bool switchValue = false;
  bool untillInstallment = false;
  int minimumInstallment = 12;
  MutualFundsController? mutualFundsController;
  TextEditingController sipController = TextEditingController();
  @override
  void initState() {
    mutualFundsController =
        Provider.of<MutualFundsController>(context, listen: false);
    super.initState();
  }

  showBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: SizeConfig.screenHeight * 0.5,
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Item has been added in the cart',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Lottie.asset(
                  'assets/animation/added_cart.json',
                  height: SizeConfig.screenHeight * 0.3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Buy More',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(appColorPrimary)),
                    ),
                    ElevatedButton(
                      child: Text(
                        'Buy More',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(appColorPrimary)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartPageList()));
                      },
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/globalfund.png', height: 30),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.screenWidth * 0.7,
                    child: Text(
                      widget.model!.fundName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.headline3!.color),
                    ),
                  ),
                  Consumer<MutualFundsController>(
                      builder: (context, controller, child) {
                    return Text(
                      '${controller.cats} | ${controller.subcats}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .headline3!
                              .color!
                              .withOpacity(0.4)),
                    );
                  }),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          sipToggle(sipToggleValue: sipToggleValue),
          sipToggleValue[0] == true
              ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 150,
                      child: TextField(
                        controller: sipController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor:
                            Theme.of(context).textSelectionTheme.cursorColor,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 3.0),
                          ),
                          hintText:
                              AppLocalizations.of(context)!.investmentAmount,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${AppLocalizations.of(context)!.minimumInvestment} ${rupeeSymbol}500',
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .textTheme
                              .headline3!
                              .color!
                              .withOpacity(0.5)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    installmentToggle(
                        intallmentToggleValue: intallmentToggleValue),
                    const SizedBox(
                      height: 20,
                    ),
                    !intallmentToggleValue[0] && sipToggleValue[0]
                        ? Container(
                            width: SizeConfig.screenWidth * 0.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: appColorPrimary)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.transparent)),
                                    onPressed: untillInstallment
                                        ? null
                                        : () {
                                            setState(() {
                                              if (minimumInstallment > 5) {
                                                minimumInstallment =
                                                    minimumInstallment - 1;
                                              }
                                            });
                                          },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    )),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Text(
                                    '$minimumInstallment',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.transparent)),
                                    onPressed: untillInstallment
                                        ? null
                                        : () {
                                            setState(() {
                                              minimumInstallment =
                                                  minimumInstallment + 1;
                                            });
                                          },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          )
                        : Container()
                  ],
                )
              : Container(),
        ],
      ),
      bottomNavigationBar: Consumer<MutualFundsController>(
          builder: (context, controller, child) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () async {
                    var value;
                    if (sipToggleValue[0]) {
                      value = await mutualFundsController?.addToCart(
                          context: context,
                          fundId: widget.model?.fundId,
                          amount: sipController.text,
                          investmentType: "sip",
                          totalInstallments: minimumInstallment);
                      if (value == true) {}
                    } else {
                      value = await mutualFundsController?.addToCart(
                          context: context,
                          fundId: widget.model?.fundId,
                          amount: sipController.text,
                          investmentType: "lumpsum",
                          totalInstallments: minimumInstallment);
                    }
                    if (value == true) {
                      showBottomSheet();
                    }
                  },
                  child: Container(
                      height: SizeConfig.blockSizeHorizontal * 15,
                      width: SizeConfig.blockSizeHorizontal * 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: appColorPrimary),
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: controller.isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              AppLocalizations.of(context)!.addtocart,
                              style: TextStyle(color: Colors.white),
                            ))),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: SizeConfig.blockSizeHorizontal * 15,
                      width: SizeConfig.blockSizeHorizontal * 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: appColorPrimary),
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)!.proceed,
                        style: TextStyle(color: Colors.white),
                      ))),
            ],
          ),
        );
      }),
    );
  }

  installmentToggle({List<bool>? intallmentToggleValue}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    intallmentToggleValue![0] = true;
                    intallmentToggleValue[1] = false;
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 12,
                    width: SizeConfig.blockSizeHorizontal * 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: appColorPrimary),
                        color: intallmentToggleValue![0]
                            ? appColorPrimary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.untillCancelled,
                      style: TextStyle(
                          color: intallmentToggleValue[0]
                              ? Colors.white
                              : fontGrey),
                    ))),
            SizedBox(
              height: 5,
            ),
            Text(
              AppLocalizations.of(context)!.recommended,
              style: TextStyle(color: Colors.redAccent, fontSize: 10),
            )
          ],
        ),
        Column(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    intallmentToggleValue[0] = false;
                    intallmentToggleValue[1] = true;
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 12,
                    width: SizeConfig.blockSizeHorizontal * 30,
                    decoration: BoxDecoration(
                        border: Border.all(color: appColorPrimary),
                        color: intallmentToggleValue[1]
                            ? appColorPrimary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.custom,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: intallmentToggleValue[1]
                              ? Colors.white
                              : fontGrey),
                    ))),
            SizedBox(
              height: 2,
            ),
            Text(
              "",
              style: TextStyle(color: Colors.redAccent, fontSize: 10),
            )
          ],
        ),
      ],
    );
  }

  sipToggle({List<bool>? sipToggleValue}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              print(sipToggleValue![0]);
              setState(() {
                sipToggleValue[0] = true;
                sipToggleValue[1] = false;
              });
            },
            child: Container(
                height: SizeConfig.blockSizeHorizontal * 12,
                width: SizeConfig.blockSizeHorizontal * 30,
                decoration: BoxDecoration(
                    border: Border.all(color: appColorPrimary),
                    color: sipToggleValue![0] ? appColorPrimary : Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: Text(
                  'SIP',
                  style: TextStyle(
                      color: sipToggleValue[0] ? Colors.white : fontGrey),
                ))),
        GestureDetector(
            onTap: () {
              setState(() {
                sipToggleValue[0] = false;
                sipToggleValue[1] = true;
              });
            },
            child: Container(
                height: SizeConfig.blockSizeHorizontal * 12,
                width: SizeConfig.blockSizeHorizontal * 30,
                decoration: BoxDecoration(
                    border: Border.all(color: appColorPrimary),
                    color: sipToggleValue[1] ? appColorPrimary : Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: Text(
                  'One Time',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: sipToggleValue[1] ? Colors.white : fontGrey),
                ))),
      ],
    );
  }
}
