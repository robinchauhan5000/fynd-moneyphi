import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../theme/theme.dart';
import '../../utils/SizeConfig.dart';

class CreateGoalsScreen extends StatelessWidget {
  const CreateGoalsScreen({Key? key}) : super(key: key);

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                          color: Theme.of(context).textTheme.headline3!.color,
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
                            textName: AppLocalizations.of(context)!.retirement,
                            context: context),
                        categoreyCard(
                            assetPath: 'assets/Insurance.png',
                            textName: AppLocalizations.of(context)!.insurance,
                            context: context),
                        categoreyCard(
                            assetPath: 'assets/childfuture.png',
                            textName: AppLocalizations.of(context)!.childFuture,
                            context: context),
                        categoreyCard(
                            assetPath: 'assets/housing.png',
                            textName: AppLocalizations.of(context)!.housing,
                            context: context),
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
                          color: Theme.of(context).textTheme.headline3!.color,
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
                            textName: AppLocalizations.of(context)!.mutualFunds,
                            context: context),
                        categoreyCard(
                            assetPath: 'assets/Indulge.png',
                            textName: AppLocalizations.of(context)!.indulge,
                            context: context),
                        categoreyCard(
                            assetPath: 'assets/Car.png',
                            textName: AppLocalizations.of(context)!.car,
                            context: context),
                        categoreyCard(
                            assetPath: 'assets/Holiday.png',
                            textName: AppLocalizations.of(context)!.holiday,
                            context: context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  categoreyCard(
      {String? textName, String? assetPath, required BuildContext context}) {
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
