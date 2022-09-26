import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/screens/kycFoms/singnatureScreen.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../controller/ImagePickerController.dart';
import '../../utils/Colors.dart';
import '../../widgets/moneyPhiButton.dart';

class UploadBankProof extends StatefulWidget {
  const UploadBankProof({Key? key}) : super(key: key);

  @override
  State<UploadBankProof> createState() => _UploadBankProofState();
}

class _UploadBankProofState extends State<UploadBankProof> {
  List<bool> typeOfAccountList = [false, false];
  var imagePicker;
  File? images;

  @override
  Widget build(BuildContext context) {
    imagePicker = Provider.of<ImagePickerController>(context);
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.uploadBankProof,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline3?.color,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.selectthedocumentyouwillupload,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline3?.color,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.ourteamwillverifyyourbank,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline3?.color,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                typeOfAccount(typeOfAccountList: typeOfAccountList),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(4),
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: appColorPrimary)),
                  child: imagePicker.images == null
                      ? Container()
                      : Image.file(
                          imagePicker.images!,
                          fit: BoxFit.fitWidth,
                          width: SizeConfig.screenWidth,
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        imagePicker.pickImage();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 10),
                        height: 50,
                        width: SizeConfig.screenWidth * 0.3,
                        decoration: BoxDecoration(
                          color: appColorPrimary,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: appColorPrimary.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.camera,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        imagePicker.pickGallery();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        height: 50,
                        width: SizeConfig.screenWidth * 0.3,
                        decoration: BoxDecoration(
                          color: appColorPrimary,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: appColorPrimary.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.gallery,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                MoneyPhiButton(
                  onClick: () {
                    imagePicker.sendImageServer(imagePicker.images!, context,
                        typeOfAccountList[0] == true ? "cheque" : "cheque");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignatureScreen()));
                  },
                  buttonTitle: "Submit",
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => SignatureScreen(),
      //           ),
      //         );
      //       },
      //       child: Container(
      //         alignment: Alignment.center,
      //         margin: EdgeInsets.only(bottom: 10),
      //         height: 50,
      //         width: SizeConfig.screenWidth * 0.3,
      //         decoration: BoxDecoration(
      //           color: appColorPrimary,
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: [
      //             BoxShadow(
      //               color: appColorPrimary.withOpacity(0.4),
      //               spreadRadius: 2,
      //               blurRadius: 8,
      //             ),
      //           ],
      //         ),
      //         child: Text(
      //           AppLocalizations.of(context)!.camera,
      //           style: TextStyle(color: Colors.white, fontSize: 20),
      //         ),
      //       ),
      //     ),
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => SignatureScreen(),
      //           ),
      //         );
      //       },
      //       child: Container(
      //         alignment: Alignment.center,
      //         margin: EdgeInsets.only(
      //           bottom: 10,
      //         ),
      //         height: 50,
      //         width: SizeConfig.screenWidth * 0.3,
      //         decoration: BoxDecoration(
      //           color: appColorPrimary,
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: [
      //             BoxShadow(
      //               color: appColorPrimary.withOpacity(0.4),
      //               spreadRadius: 2,
      //               blurRadius: 8,
      //             ),
      //           ],
      //         ),
      //         child: Text(
      //           AppLocalizations.of(context)!.gallery,
      //           style: TextStyle(color: Colors.white, fontSize: 20),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  typeOfAccount({required List<bool> typeOfAccountList}) {
    return Row(
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
                  color: typeOfAccountList[0] ? appColorPrimary : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Cheque',
                  style: TextStyle(
                      color: typeOfAccountList[0] ? Colors.white : fontGrey),
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
                  color: typeOfAccountList[1] ? appColorPrimary : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Bank Statement',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: typeOfAccountList[1] ? Colors.white : fontGrey),
                ))),
      ],
    );
  }
}
