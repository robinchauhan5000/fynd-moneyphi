import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/screens/best_mutualfunds_sip/best_mutualfunds_sip_list.dart';
import 'package:moneyphi/screens/fundsphi_screen/fundsphi_screen.dart';
import 'package:moneyphi/screens/mutual_funds/better_than_fd/better_than_fd.dart';
import 'package:moneyphi/screens/mutual_funds/startsip/start_sip.dart';
import 'package:moneyphi/screens/mutual_funds/tax_saving/tax_saving.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../../controller/MutualFundsController.dart';
import '../iam_beginner/IAmBiggnerScreen.dart';

class MutualFundScreen extends StatefulWidget {
  const MutualFundScreen({Key? key}) : super(key: key);

  @override
  State<MutualFundScreen> createState() => _MutualFundScreenState();
}

class _MutualFundScreenState extends State<MutualFundScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  MutualFundsController? mutualFundsController;
  @override
  void initState() {
    super.initState();

    mutualFundsController =
        Provider.of<MutualFundsController>(context, listen: false);
    Future.delayed(Duration(milliseconds: 100), () {
      mutualFundsController!.getCategories(context);

      _tabController = TabController(
          length: mutualFundsController!.categoryModel == null
              ? 4
              : mutualFundsController!.categoryModel!.data!.length,
          vsync: this);
    });
  }

  var categories = [
    "Equity",
    "Hybrid",
    "Debt",
    "Commodities",
  ];

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Consumer<MutualFundsController>(
          builder: (context, controller, child) {
        return controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.mutualFunds,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline3!.color,
                              fontSize: SizeConfig.blockSizeHorizontal * 6,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TabBar(
                              labelColor: Colors.white,
                              unselectedLabelColor: appColorPrimary,
                              controller: _tabController,
                              isScrollable: true,
                              padding: EdgeInsets.zero,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: appColorPrimary),
                              tabs: [
                                for (int i = 0;
                                    i <
                                        mutualFundsController!
                                            .categoryModel!.data!.length;
                                    i++)
                                  Tab(
                                      text: mutualFundsController!
                                          .categoryModel!.data!
                                          .elementAt(i)
                                          .catName),
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 8,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Consumer<MutualFundsController>(
                              builder: (context, mutualFundcontroller, child) {
                            return TabBarView(
                                controller: _tabController,
                                children: [
                                  for (int i = 0;
                                      i <
                                          mutualFundcontroller
                                              .categoryModel!.data!.length;
                                      i++)
                                    equity(context, i)
                                ]);
                          }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.bestSIPFunds,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .color,
                                  fontSize: SizeConfig.blockSizeHorizontal * 6,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .basedonlast5yearsreturn,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .color,
                                fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 150,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(10),
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BestMutualFundsSipList()));
                                  },
                                  child: bestSipCard(context)),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BestMutualFundsSipList()));
                                  },
                                  child: bestSipCard(context)),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BestMutualFundsSipList()));
                                  },
                                  child: bestSipCard(context)),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BestMutualFundsSipList()));
                                  },
                                  child: bestSipCard(context)),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BestMutualFundsSipList()));
                                  },
                                  child: bestSipCard(context)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5),
                          child: Text(
                            'Investment Ideas',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .color,
                                fontSize: SizeConfig.blockSizeHorizontal * 6,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 130,
                          child: ListView(
                            padding: EdgeInsets.all(10),
                            scrollDirection: Axis.horizontal,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              IAmBeginnerScreen()));
                                },
                                child: InvestmentIdeasCard(
                                  textName: AppLocalizations.of(context)!
                                      .iamabeginner,
                                  assetPath: 'assets/icons8-garden-96 1.png',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StartSIP()));
                                },
                                child: InvestmentIdeasCard(
                                  textName: AppLocalizations.of(context)!
                                      .startSIPwith,
                                  assetPath: 'assets/icons8-garden-96 1.png',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BetterThanFD()));
                                },
                                child: InvestmentIdeasCard(
                                  textName: AppLocalizations.of(context)!
                                      .betterthanFD,
                                  assetPath: 'assets/icons8-garden-96 1.png',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TaxSaving()));
                                },
                                child: InvestmentIdeasCard(
                                  textName: AppLocalizations.of(context)!
                                      .taxsavingfunds,
                                  assetPath: 'assets/savetax.png',
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }

  equity(BuildContext context, i) {
    return Consumer<MutualFundsController>(
        builder: (context, controller, child) {
      return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: controller.categoryModel!.data!
              .elementAt(i)
              .subCategories!
              .length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: categoreyCard(
                  cat: controller.categoryModel!.data!.elementAt(i).catName,
                  assetPath: controller.categoryModel!.data!
                              .elementAt(i)
                              .subCategories!
                              .elementAt(index)
                              .image ==
                          ""
                      ? 'assets/largecap.png'
                      : controller.categoryModel!.data!
                          .elementAt(0)
                          .subCategories!
                          .elementAt(index)
                          .image,
                  textName: controller.categoryModel!.data!
                      .elementAt(i)
                      .subCategories!
                      .elementAt(index)
                      .subCatName),
            );
          });
    });
  }

  hybrid(BuildContext context) {
    return Consumer<MutualFundsController>(
        builder: (context, controller, child) {
      return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: controller.categoryModel!.data!
              .elementAt(1)
              .subCategories!
              .length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: categoreyCard(
                  assetPath: controller.categoryModel!.data!
                              .elementAt(1)
                              .subCategories!
                              .elementAt(index)
                              .image ==
                          ""
                      ? 'assets/largecap.png'
                      : controller.categoryModel!.data!
                          .elementAt(0)
                          .subCategories!
                          .elementAt(index)
                          .image,
                  textName: controller.categoryModel!.data!
                      .elementAt(1)
                      .subCategories!
                      .elementAt(index)
                      .subCatName),
            );
          });
    });
  }

  debt(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FundsPhiScreen(category: "Debt")));
              },
              child: categoreyCard(
                  assetPath: 'assets/overnight.png', textName: "  Overnight  "),
            ),
            categoreyCard(
                assetPath: 'assets/Liquid.png', textName: "  Liquid Fund  "),
            categoreyCard(
                assetPath: 'assets/Ultrashort.png', textName: "Ultrashort"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: categoreyCard(
                  assetPath: 'assets/Multi-Asset.png',
                  textName: "Multi Assets"),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             FundsPhiScreen()));
              },
            ),
            categoreyCard(
                assetPath: 'assets/Arbitrage.png', textName: "Arbitage Fund"),
            categoreyCard(
                assetPath: 'assets/icons8-garden-96 1.png',
                textName: "View More"),
          ],
        ),
      ],
    );
  }

  commodities(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FundsPhiScreen(category: "Commodities")));
              },
              child: categoreyCard(
                  assetPath: 'assets/Gold.png', textName: "Gold Fund"),
            ),
            categoreyCard(
                assetPath: 'assets/Silver.png', textName: "Silver Fund"),
            categoreyCard(
                assetPath: 'assets/Ultrashort.png', textName: "View More"),
          ],
        ),
      ],
    );
  }

  Container bestSipCard(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.2,
      width: SizeConfig.screenWidth * 0.6,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DSP',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Theme.of(context).primaryColor,
                    decorationThickness: 4,
                    color: Theme.of(context).textTheme.headline3!.color,
                    fontSize: SizeConfig.blockSizeHorizontal * 5,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                'DSP Midcap',
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline3!.color,
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '5Y',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline3!.color,
                        fontSize: SizeConfig.blockSizeHorizontal * 4,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '25.78%"',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline3!.color,
                        fontSize: SizeConfig.blockSizeHorizontal * 4,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '5Y',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline3!.color,
                        fontSize: SizeConfig.blockSizeHorizontal * 4,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '25.78%"',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline3!.color,
                        fontSize: SizeConfig.blockSizeHorizontal * 4,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  categoreyCard({String? textName, String? assetPath, String? cat}) {
    return GestureDetector(
      onTap: () async {
        Response res =
            await mutualFundsController!.getsearchfunds(context, cat, textName);
        if (res.statusCode == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FundsPhiScreen(category: cat!, subCat: textName)));
        }
      },
      child: Container(
        height: SizeConfig.blockSizeHorizontal * 30,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      assetPath!,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              textName!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.headline3?.color,
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5),
            ),
          ],
        ),
      ),
    );
  }

  InvestmentIdeasCard({
    String? textName,
    String? assetPath,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(5),
      width: SizeConfig.blockSizeHorizontal * 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 8,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  assetPath!,
                ),
              ),
            ),
          ),
          Text(
            textName!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headline3?.color,
                fontSize: SizeConfig.blockSizeHorizontal * 3.5),
          ),
        ],
      ),
    );
  }
}
