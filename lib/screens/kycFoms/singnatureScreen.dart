import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/screens/kycFoms/kyc_bloc/partfive/part_five_cubit.dart';
import 'package:moneyphi/utils/AppSnackBar.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/widgets/money_button.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

import '../../controller/dashBoardController.dart';
import '../NavigatonBar/BottomNavigation.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({Key? key}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  bool isChecked = false;

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.blue,
    exportBackgroundColor: Colors.white,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );
  @override
  Widget build(BuildContext context) {
    final dashboardController =
        Provider.of<DashBoardController>(context, listen: false);
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
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.uploadSignature,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline3?.color,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.signinthespaceprovided,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline3?.color,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 380,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: appColorPrimary)),
                  child: Stack(
                    children: [
                      Signature(
                        controller: _controller,
                        height: 350,
                        backgroundColor: Colors.white,
                      ),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.clear();
                              });
                            },
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BlocConsumer<PartFiveCubit, PartFiveState>(
                  listener: (context, state) {
                    if (state.partTwoFiveStaus == PartTwoFiveStaus.successful) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBarV2()));
                    }
                    if (state.partTwoFiveStaus == PartTwoFiveStaus.error) {
                      appSnackBar(content: state.error, context: context);
                    }
                  },
                  builder: (context, state) {
                    return Consumer<DashBoardController>(
                        builder: (context, controller, child) {
                      return Column(
                        children: [
                          MoneyButton(
                            onClick: () {
                              if (_controller.isEmpty) {
                                appSnackBar(
                                    content: "Please sign on the pad",
                                    context: context);
                              } else {
                                _controller.toPngBytes().then((value) async {
                                  print(value);
                                  final imageEncoded = base64.encode(value!);
                                  log(imageEncoded);
                                  dashboardController.sendsignature(
                                      context: context, data: imageEncoded);
                                });

                                context.read<PartFiveCubit>().postPartTwoFive();
                              }
                            },
                            textWidet: state.partTwoFiveStaus ==
                                    PartTwoFiveStaus.loading
                                ? CircularProgressIndicator()
                                : Text(
                                    'Submit',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .iagreethatIamaIndiancitizenresidinginIndia,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline3?.color,
                            ),
                            maxLines: 5,
                          ),
                        ],
                      );
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: MoneyPhiButton(
      //   buttonTitle: AppLocalizations.of(context)!.confirmProceed,
      //   onClick: () => {
      //     // Navigator.push(
      //     //   context,
      //     //   MaterialPageRoute(
      //     //     builder: (context) => BscFamilyDetails(),
      //     //   ),
      //     // ),
      //   },
      // ),
    );
  }
}
