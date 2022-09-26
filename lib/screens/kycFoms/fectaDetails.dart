import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/screens/kycFoms/kyc_bloc/part_two_two/part_two_two_cubit.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:moneyphi/widgets/customTextField.dart';

import '../../Model/KycFormModel/PartTwoTwoModel.dart';
import '../../widgets/money_button.dart';
import 'nomineeDetails.dart';

TextEditingController? countryNameController = TextEditingController();
TextEditingController? politicallyExposedController = TextEditingController();

class FectaDetails extends StatefulWidget {
  const FectaDetails({Key? key}) : super(key: key);

  @override
  State<FectaDetails> createState() => _FectaDetailsState();
}

class _FectaDetailsState extends State<FectaDetails> {
  List<bool> taxOutsideIndiaList = [true, false];
  List<bool> politicallyExposedList = [true, false];
  bool arePoliticallyExposed = false;
  bool arePoliticallyRelated = false;

  String politicallyExposedValue = 'N';
  String politicallyRelatedValue = 'N';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   countryNameController?.dispose();
  //   politicallyExposedController?.dispose();
  //   super.dispose();
  // }

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  taxOutsideIndia(taxOutsideIndiaList: taxOutsideIndiaList),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: taxOutsideIndiaList[1],
                    child: CustomTextField(
                      label: AppLocalizations.of(context)!
                          .doyoupaytaxesoutsideIndia,
                      hint: '',
                      controller: countryNameController,
                      tooltipActive: false,
                      onChange: (e) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  politicallyExposed(
                      politicallyExposedList: politicallyExposedList),
                  SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: politicallyExposedList[1],
                    child: CustomTextField(
                      label: AppLocalizations.of(context)!
                          .doyoupaytaxesoutsideIndia,
                      hint: '',
                      controller: countryNameController,
                      tooltipActive: false,
                      onChange: (e) {},
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: politicallyExposedList[1],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .areyouPoliticallyexposedorrelated,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline3?.color,
                          ),
                        ),
                        Checkbox(
                          value: arePoliticallyExposed,
                          fillColor: MaterialStateProperty.all(appColorPrimary),
                          onChanged: (val) {
                            setState(() {
                              arePoliticallyExposed = !arePoliticallyExposed;
                              politicallyExposedValue =
                                  arePoliticallyExposed ? "Y" : "N";
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: politicallyExposedList[1],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .areyouPoliticallyexposedorrelated,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline3?.color,
                          ),
                        ),
                        Checkbox(
                          value: arePoliticallyRelated,
                          fillColor: MaterialStateProperty.all(appColorPrimary),
                          onChanged: (val) {
                            setState(() {
                              politicallyRelatedValue =
                                  arePoliticallyRelated ? "Y" : "N";
                              arePoliticallyRelated = !arePoliticallyRelated;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocConsumer<PartTwoTwoCubit, PartTwoTwoState>(
        listener: (context, state) {
          if (state.partTwoTwoStaus == PartTwoTwoStaus.successful) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NomineeDetails(),
              ),
            );
          }
          if (state.partTwoTwoStaus == PartTwoTwoStaus.error) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error!)));
          }
        },
        builder: (context, state) {
          return MoneyButton(
            textWidet: (state.partTwoTwoStaus == PartTwoTwoStaus.loading)
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    AppLocalizations.of(context)!.continueText,
                    style: TextStyle(color: Colors.white),
                  ),
            onClick: () => {
              print(politicallyExposedValue),
              RepositoryProvider.of<PartTwoTwoModel>(context)
                  .politicallyExposed = politicallyExposedValue,
              RepositoryProvider.of<PartTwoTwoModel>(context)
                  .politicallyRelated = politicallyRelatedValue,
              if (_formKey.currentState!.validate())
                {
                  context.read<PartTwoTwoCubit>().postPartTwoOneKyc(
                      RepositoryProvider.of<PartTwoTwoModel>(context))
                }
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  taxOutsideIndia({required List<bool> taxOutsideIndiaList}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.doyoupaytaxesoutsideIndia,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.headline3?.color,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    taxOutsideIndiaList[0] = true;
                    taxOutsideIndiaList[1] = false;
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 15,
                    width: SizeConfig.blockSizeHorizontal * 20,
                    decoration: BoxDecoration(
                        color: taxOutsideIndiaList[0]
                            ? appColorPrimary
                            : Colors.white,
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.no,
                      style: TextStyle(
                          color: taxOutsideIndiaList[0]
                              ? Colors.white
                              : Colors.black),
                    ))),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    taxOutsideIndiaList[0] = false;
                    taxOutsideIndiaList[1] = true;
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 15,
                    width: SizeConfig.blockSizeHorizontal * 20,
                    decoration: BoxDecoration(
                        color: taxOutsideIndiaList[1]
                            ? appColorPrimary
                            : Colors.white,
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.yes,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: taxOutsideIndiaList[1]
                              ? Colors.white
                              : Colors.black),
                    ))),
          ],
        ),
      ],
    );
  }

  politicallyExposed({required List<bool> politicallyExposedList}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.doyoupaytaxesoutsideIndia,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.headline3?.color,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    politicallyExposedList[0] = true;
                    politicallyExposedList[1] = false;
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 15,
                    width: SizeConfig.blockSizeHorizontal * 20,
                    decoration: BoxDecoration(
                        color: politicallyExposedList[0]
                            ? appColorPrimary
                            : Colors.white,
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.no,
                      style: TextStyle(
                          color: politicallyExposedList[0]
                              ? Colors.white
                              : fontGrey),
                    ))),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    politicallyExposedList[0] = false;
                    politicallyExposedList[1] = true;
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 15,
                    width: SizeConfig.blockSizeHorizontal * 20,
                    decoration: BoxDecoration(
                        color: politicallyExposedList[1]
                            ? appColorPrimary
                            : Colors.white,
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.yes,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: politicallyExposedList[1]
                              ? Colors.white
                              : fontGrey),
                    ))),
          ],
        ),
      ],
    );
  }
}
