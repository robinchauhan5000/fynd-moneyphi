import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:moneyphi/screens/kycFoms/pan_verify_cubit/pan_kycverification_cubit.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:moneyphi/widgets/customTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/KycModel.dart';
import '../../widgets/money_button.dart';
import 'bscPersonalDetails.dart';

TextEditingController panNumberController = TextEditingController();

class PanCardFormScreen extends StatefulWidget {
  const PanCardFormScreen({Key? key}) : super(key: key);

  @override
  State<PanCardFormScreen> createState() => _PanCardFormScreenState();
}

class _PanCardFormScreenState extends State<PanCardFormScreen> {
  final _formKey = GlobalKey<FormState>();

  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get('token');
  }

  String? token;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.letsbegun,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline3?.color,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockSizeHorizontal * 6),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .weneedyourpantoprocessfurther,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline3?.color,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    BlocBuilder<PanKycverificationCubit,
                        PanKycverificationState>(
                      builder: (context, state) {
                        return CustomTextField(
                          label: 'PAN',
                          hint: 'pan',
                          controller: panNumberController,
                          tooltipActive: true,
                          tooltipMessage: 'jjjjjjjjjjjjjjjjjjjjjjjj',
                          textInputType: TextInputType.text,
                          maxLength: 10,
                          textCapitalization: TextCapitalization.characters,
                          onChange: (e) {
                            RepositoryProvider.of<KycModel>(context).panNumber =
                                e;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              BlocConsumer<PanKycverificationCubit, PanKycverificationState>(
                listener: (context, state) {
                  if (state.panVerificationStaus ==
                      PanVerificationStaus.Completed) {
                    if (state.panVerificationModel?.kycDone == true) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                              child: state.panVerificationModel!.appName != null
                                  ? Text(state.panVerificationModel!.appName!)
                                  : Text(''),
                            ),
                            alignment: Alignment.center,
                            content:
                                Lottie.asset('assets/animation/success.json'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel')),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BSCPersonDetails(),
                                    ),
                                  );
                                },
                                child: Text('Submit'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Please Complete you KYC"),
                            alignment: Alignment.center,
                            content: Text(
                                "We are redirecting you to the web for KYC."),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel')),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BSCPersonDetails(),
                                    ),
                                  );
                                },
                                child: Text('Submit'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }
                  }
                  if (state.panVerificationStaus ==
                      PanVerificationStaus.Error) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => BSCPersonDetails(),
                    //   ),
                    // );
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage!)));
                  }
                },
                builder: (context, state) {
                  return MoneyButton(
                    textWidet: (state.panVerificationStaus ==
                            PanVerificationStaus.Loading)
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            AppLocalizations.of(context)!.continueText,
                            style: TextStyle(color: Colors.white),
                          ),
                    onClick: () async {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<PanKycverificationCubit>()
                            .checkKyc(panNumber: panNumberController.text);
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // customTextField(
  //     {}) {
  //   return ;
  // }
}
