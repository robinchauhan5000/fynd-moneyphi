import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/controller/PortfolioController.dart';
import 'package:moneyphi/screens/portfolio/portfolio_transaction_screen.dart';
import 'package:provider/provider.dart';

import '../../Model/PortfolioModal.dart';
import '../../theme/theme.dart';
import '../../utils/Colors.dart';
import '../../utils/SizeConfig.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  PortfolioController? portfolioController;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () {
      portfolioController =
          Provider.of<PortfolioController>(context, listen: false);
      portfolioController?.getPortfolioDetails(context);
      print("portfolioController?.portfolioModal?.totalIrr");
      print(portfolioController?.portfolioModal?.totalIrr);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              // overflow: Overflow.visible,
              children: [
                Container(
                  height: SizeConfig.screenHeight * 0.4,
                  decoration: BoxDecoration(
                      color: appColorPrimary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Consumer<PortfolioController>(
                      builder: (context, controller, child) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Portfolio',
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 8,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${controller.portfolioModal?.totalCurrentValue}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [mainboxshadow]),
                              padding: EdgeInsets.all(15),
                              child: Text(
                                "Mutual Funds",
                                style: TextStyle(
                                    color: appColorPrimary,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Investment",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${controller.portfolioModal?.totalInvestment?.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                Text(
                                  "XIRR",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${controller.portfolioModal?.totalIrr?.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    );
                  }),
                ),
                Positioned(
                  bottom: -20,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 70,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [mainboxshadow]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [mainboxshadow]),
                          child: Icon(
                            Icons.account_circle,
                            size: SizeConfig.screenHeight * 0.04,
                            color: appColorPrimary,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [mainboxshadow]),
                          child: Icon(
                            Icons.wifi_tethering_outlined,
                            size: SizeConfig.screenHeight * 0.04,
                            color: appColorPrimary,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [mainboxshadow]),
                          child: Icon(
                            Icons.error,
                            size: SizeConfig.screenHeight * 0.04,
                            color: appColorPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: SizeConfig.screenHeight * 0.355,
              child: Consumer<PortfolioController>(
                  builder: (context, controller, child) {
                return ListView.builder(
                    itemCount: controller.portfolioModal?.funds?.length,
                    itemBuilder: (context, index) {
                      return fundCard(
                          data: controller.portfolioModal?.funds?[index]);
                    });
              }),
            )
          ],
        ),
      ),
    ));
  }

  fundCard({Funds? data}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PortFolioTransactions(
                      fundID: data?.fundObj?.id,
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [mainboxshadow],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.03,
                  width: SizeConfig.screenHeight * 0.04,
                  //color: Colors.pink,
                  child: Image.asset('images/icici.png', fit: BoxFit.cover),
                ),
                Text(
                  data?.fundObj?.name ?? "",
                  style: TextStyle(
                      fontSize: SizeConfig.screenHeight * 0.017,
                      fontWeight: FontWeight.bold),
                ),
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: const [
                          SizedBox(width: 10),
                          Text(
                            "View Details",
                            style: TextStyle(color: appColorPrimary),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Invest",
                            style: TextStyle(color: appColorPrimary),
                          )
                        ],
                      ),
                    ),
                  ],
                  offset: const Offset(0, 80),
                  color: Colors.white,
                  elevation: 2,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Invested"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("${rupeeSymbol}${data?.formattedTotalAmount}")
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Current Value",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("${rupeeSymbol}${data?.formattedCurrentValue}")
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Return%",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${data?.irr}",
                      style: TextStyle(color: appColorPrimary),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
