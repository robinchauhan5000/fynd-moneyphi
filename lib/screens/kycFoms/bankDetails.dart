import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/Model/GetProfileModel.dart';
import 'package:moneyphi/controller/dashBoardController.dart';
import 'package:moneyphi/screens/kycFoms/uploadBankProof.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:moneyphi/widgets/customTextField.dart';
import 'package:moneyphi/widgets/moneyPhiButton.dart';
import 'package:provider/provider.dart';

import '../../controller/BankDetailsController.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({Key? key}) : super(key: key);

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  List<bool> typeOfAccountList = [false, false];
  KYCController? kycController;
  DashBoardController? dashBoardController;
  bool showPass = true;
  GetProfileModel? getProfileModel;
  @override
  void initState() {
    kycController = Provider.of<KYCController>(context, listen: false);
    dashBoardController =
        Provider.of<DashBoardController>(context, listen: false);
    print("getProfileModel?.accType1");
    print(dashBoardController?.getProfileModel?.accType1);

    if (dashBoardController?.getProfileModel?.accType1 == "SB") {
      setState(() {
        typeOfAccountList[0] = true;
        typeOfAccountList[1] = false;
      });
    } else if (dashBoardController?.getProfileModel?.accType1 == "CR") {
      typeOfAccountList[0] = false;
      typeOfAccountList[1] = true;
    }
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // ifscCodeController?.dispose();
    // bankNameController?.dispose();
    // branchNameController?.dispose();
    // accountNumberController?.dispose();
    // reaccountNumberController?.dispose();
    super.dispose();
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
      body: Consumer<KYCController>(
        builder: (BuildContext context, controller, Widget? child) {
          return SafeArea(
            child: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.only(right: 30, left: 30, bottom: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.bankDetails,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline3?.color,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 6),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        label: AppLocalizations.of(context)!.iFSCCode,
                        hint: AppLocalizations.of(context)!.iFSCCode,
                        controller: controller.ifscCodeController,
                        textCapitalization: TextCapitalization.characters,
                        maxLength: 11,
                        tooltipActive: false,
                        onChange: (e) {
                          if (e.length == 11) {
                            kycController?.getIfscCode(
                                context, controller.ifscCodeController!.text);
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        label: AppLocalizations.of(context)!.bankName,
                        hint: AppLocalizations.of(context)!.bankName,
                        controller: controller.bankNameController,
                        tooltipActive: false,
                        onChange: (e) {},
                        maxLength: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        label: AppLocalizations.of(context)!.branch,
                        hint: AppLocalizations.of(context)!.branch,
                        controller: controller.branchNameController,
                        tooltipActive: false,
                        onChange: (e) {},
                        maxLength: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // CustomTextField(
                      //   label: AppLocalizations.of(context)!.accountNumber,
                      //   hint: AppLocalizations.of(context)!.accountNumber,
                      //   controller: controller.accountNumberController,
                      //   tooltipActive: false,
                      //   textInputType: TextInputType.number,
                      //   onChange: (e) {},
                      //   obsecurePassword: true,
                      //   maxLength: 12,
                      // ),
                      Container(
                        child: TextFormField(
                          obscureText: showPass,
                          controller: controller.accountNumberController,
                          // maxLength: 15,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              label: Text(
                                  AppLocalizations.of(context)!.accountNumber),
                              hintText:
                                  AppLocalizations.of(context)!.accountNumber,
                              filled: true,
                              fillColor: Colors.white70,
                              border: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  if (showPass) {
                                    setState(() {
                                      showPass = false;
                                    });
                                  } else {
                                    setState(() {
                                      showPass = true;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color:
                                      showPass ? Colors.grey : appColorPrimary,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        label:
                            AppLocalizations.of(context)!.reenterAccountNumber,
                        hint:
                            AppLocalizations.of(context)!.reenterAccountNumber,
                        controller: controller.reaccountNumberController,
                        tooltipActive: false,
                        onChange: (e) {},
                        // maxLength: 12,
                        textInputType: TextInputType.number,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (text.length < 12) {
                            return 'Please Add Correct Account Number';
                          }
                          if (text !=
                              controller.accountNumberController!.text) {
                            print('not matched');
                            return 'Account number is not matching';
                          }
                          return null;
                        },
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      typeOfAccount(typeOfAccountList: typeOfAccountList),
                      SizedBox(
                        height: 50,
                      ),
                      controller.isLoading
                          ? CircularProgressIndicator()
                          : MoneyPhiButton(
                              buttonTitle:
                                  AppLocalizations.of(context)!.continueText,
                              onClick: () => {
                                print((_formKey.currentState!.validate() &&
                                    controller.accountNumberController!.text ==
                                        controller
                                            .reaccountNumberController!.text)),
                                if (_formKey.currentState!.validate() &&
                                    controller.accountNumberController!.text ==
                                        controller
                                            .reaccountNumberController!.text)
                                  {
                                    controller
                                        .sendBankDetails(context)
                                        .then((value) => {
                                              if (value != null)
                                                {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              UploadBankProof()))
                                                }
                                            })
                                  }
                              },
                            ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  typeOfAccount({required List<bool> typeOfAccountList}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.selectaccounttype,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    typeOfAccountList[0] = true;
                    typeOfAccountList[1] = false;
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 15,
                    width: SizeConfig.blockSizeHorizontal * 30,
                    decoration: BoxDecoration(
                      color:
                          typeOfAccountList[0] ? appColorPrimary : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.saving,
                      style: TextStyle(
                          color:
                              typeOfAccountList[0] ? Colors.white : fontGrey),
                    ))),
            GestureDetector(
                onTap: () {
                  setState(() {
                    typeOfAccountList[0] = false;
                    typeOfAccountList[1] = true;
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 15,
                    width: SizeConfig.blockSizeHorizontal * 30,
                    decoration: BoxDecoration(
                      color:
                          typeOfAccountList[1] ? appColorPrimary : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.current,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color:
                              typeOfAccountList[1] ? Colors.white : fontGrey),
                    ))),
          ],
        ),
      ],
    );
  }
}
