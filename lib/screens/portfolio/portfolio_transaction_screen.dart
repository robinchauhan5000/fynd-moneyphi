import 'package:flutter/material.dart';
import 'package:moneyphi/controller/PortfolioController.dart';
import 'package:moneyphi/screens/portfolio/sip_portfolio_details.dart';
import 'package:moneyphi/theme/theme.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

class PortFolioTransactions extends StatefulWidget {
  int? fundID;
  PortFolioTransactions({Key? key, this.fundID}) : super(key: key);

  @override
  State<PortFolioTransactions> createState() => _PortFolioTransactionsState();
}

class _PortFolioTransactionsState extends State<PortFolioTransactions> {
  PortfolioController? portfolioController;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () {
      portfolioController =
          Provider.of<PortfolioController>(context, listen: false);
      portfolioController?.getPorfolioTransaction(context, widget.fundID!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        backwardsCompatibility: true,
        elevation: 0,
      ),
      body: SafeArea(child:
          Consumer<PortfolioController>(builder: (context, controller, child) {
        return Column(
          children: [
            FundDetailedCard(size, controller, context),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.03,
                ),
                Text(
                  'Transactions',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  width: size.width * 0.65,
                ),
                Icon(Icons.network_cell),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller
                      .portfolioTransactionModel!.data!.transactions!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return transactionCard(controller, index, size);
                  }),
            ),
          ],
        );
      })),
    );
  }

  transactionCard(PortfolioController controller, int index, Size size) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [mainboxshadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.calendar_month_rounded)),
                  Text(controller.portfolioTransactionModel!.data!
                      .transactions![index].dATE!)
                ],
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 5,
              ),
              Container(
                child: Text(controller.portfolioTransactionModel!.data!
                    .transactions![index].investmentType!),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
            height: 10,
          ),
          SizedBox(height: size.height * 0.017),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: size.width * 0.075),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Invested",
                    style: TextStyle(
                        color: Colors.grey,
                        //fontSize: size.height * 0.016,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    r'$45,000',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.18),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Current Value",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    r'$60,000',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.13),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Return%",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    r'12.67%',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
            height: 10,
            color: Colors.greenAccent,
          ),
          SizedBox(height: size.height * 0.017),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: size.width * 0.075),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Avg Buying Nav",
                    style: TextStyle(
                        color: Colors.grey,
                        //fontSize: size.height * 0.016,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    r'$45,000',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.08),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Current NAV",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    r'$60,000',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Units",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.portfolioTransactionModel!.data!
                        .transactions![index].units
                        .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  FundDetailedCard(
      Size size, PortfolioController controller, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [mainboxshadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: size.width * 0.033),
              SizedBox(
                height: size.height * 0.03,
                width: size.width * 0.06,
                //color: Colors.pink,
                child: Image.asset('images/icici.png', fit: BoxFit.cover),
              ),
              SizedBox(width: size.width * 0.05),
              Container(
                width: controller
                        .portfolioTransactionModel!.data!.fund!.name!.length /
                    10 *
                    35,
                child: Text(
                  controller.portfolioTransactionModel!.data!.fund!.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: size.width * 0.08),
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SIPPortfolioDetails()));
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                      children: const [
                        SizedBox(width: 10),
                        Text(
                          "View SIPs",
                          style: TextStyle(color: Colors.greenAccent),
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        SizedBox(width: 10),
                        Text(
                          "Fund Details",
                          style: TextStyle(color: Colors.greenAccent),
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
                          "Statements",
                          style: TextStyle(color: Colors.greenAccent),
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
          Divider(
            thickness: 1.5,
            height: 10,
          ),
          SizedBox(height: size.height * 0.017),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: size.width * 0.075),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Invested",
                    style: TextStyle(
                        color: Colors.grey,
                        //fontSize: size.height * 0.016,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.portfolioTransactionModel!.data!.fund!
                        .formattedTotalInvestment!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.18),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Current Value",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.portfolioTransactionModel!.data!.fund!
                        .formattedTotalMarketValue!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.13),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Return%",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.portfolioTransactionModel!.data!.fund!.irr
                        .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1.5,
            height: 10,
            color: Colors.greenAccent,
          ),
          SizedBox(height: size.height * 0.017),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: size.width * 0.075),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Avg Buying Nav",
                    style: TextStyle(
                        color: Colors.grey,
                        //fontSize: size.height * 0.016,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.portfolioTransactionModel!.data!.fund!
                        .formattedTotalInvestment!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.08),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Current NAV",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller
                        .portfolioTransactionModel!.data!.fund!.formattedNav!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.15),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Units",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.portfolioTransactionModel!.data!.fund!.totalUnits
                        .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                        fontSize: size.height * 0.016),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
