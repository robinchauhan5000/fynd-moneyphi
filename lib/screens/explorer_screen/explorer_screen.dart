import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/screens/mutual_funds/mutual_funds_main/mutual_funds_screen.dart';
import 'package:moneyphi/theme/theme.dart';
import 'package:moneyphi/utils/SizeConfig.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({Key? key}) : super(key: key);

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start Investing',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline3!.color,
                      fontSize: SizeConfig.blockSizeHorizontal * 6,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [mainboxshadow],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: categoreyCard(
                                assetPath: 'assets/mutualfunds.png',
                                textName:
                                    AppLocalizations.of(context)!.mutualFunds),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MutualFundScreen()));
                            },
                          ),
                          categoreyCard(
                              assetPath: 'assets/precious metal.png',
                              textName: 'Precious\nMetals'),
                          categoreyCard(
                              assetPath: 'assets/icons8-garden-96 1.png',
                              textName: 'Smallcases'),
                        ],
                      ),
                      Row(
                        children: [
                          categoreyCard(
                              assetPath: 'assets/indian stock.png',
                              textName: "Indian Stock"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.createGoals,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline3!.color,
                      fontSize: SizeConfig.blockSizeHorizontal * 6,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [mainboxshadow],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Text(
                          AppLocalizations.of(context)!.bigDecisions,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline3!.color,
                              fontSize: SizeConfig.blockSizeHorizontal * 5,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.25,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            categoreyCard(
                                assetPath: 'assets/Retirement.png',
                                textName:
                                    AppLocalizations.of(context)!.retirement),
                            categoreyCard(
                                assetPath: 'assets/Insurance.png',
                                textName:
                                    AppLocalizations.of(context)!.insurance),
                            categoreyCard(
                                assetPath: 'assets/childfuture.png',
                                textName:
                                    AppLocalizations.of(context)!.childFuture),
                            categoreyCard(
                                assetPath: 'assets/housing.png',
                                textName:
                                    AppLocalizations.of(context)!.housing),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [mainboxshadow],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Text(
                          AppLocalizations.of(context)!.smallDecisions,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline3!.color,
                              fontSize: SizeConfig.blockSizeHorizontal * 5,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight * 0.25,
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            categoreyCard(
                                assetPath: 'assets/Reserve Fund.png',
                                textName:
                                    AppLocalizations.of(context)!.mutualFunds),
                            categoreyCard(
                                assetPath: 'assets/Indulge.png',
                                textName:
                                    AppLocalizations.of(context)!.indulge),
                            categoreyCard(
                                assetPath: 'assets/Car.png',
                                textName: AppLocalizations.of(context)!.car),
                            categoreyCard(
                                assetPath: 'assets/Holiday.png',
                                textName:
                                    AppLocalizations.of(context)!.holiday),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Text(
                    AppLocalizations.of(context)!.newBeginnings,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline3!.color,
                        fontSize: SizeConfig.blockSizeHorizontal * 6,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [mainboxshadow],
                      ),
                      child: categoreyCard(
                          assetPath: 'assets/opendemat.png',
                          textName: AppLocalizations.of(context)!.openDemat),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [mainboxshadow],
                      ),
                      child: categoreyCard(
                          assetPath: 'assets/startsip.png',
                          textName: AppLocalizations.of(context)!.startaSIP),
                    ),
                    Container(
                      width: 100,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [mainboxshadow],
                      ),
                      child: categoreyCard(
                          assetPath: 'assets/savetax.png',
                          textName: AppLocalizations.of(context)!.saveTax),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  categoreyCard({String? textName, String? assetPath}) {
    return Container(
      height: SizeConfig.blockSizeHorizontal * 30,
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
