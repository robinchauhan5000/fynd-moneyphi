import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:moneyphi/widgets/customTextField.dart';
import 'package:moneyphi/widgets/moneyPhiButton.dart';
import 'package:provider/provider.dart';

import '../../Model/BscCodeDataModel.dart';
import '../../Model/KycFormModel/PartTwoOneModel.dart';
import 'addressDetails.dart';
import 'bsc_code_bloc/bsc_code_bloc.dart';

TextEditingController? fatherNameController = TextEditingController();
TextEditingController? motherDateController = TextEditingController();

class BscFamilyDetails extends StatefulWidget {
  const BscFamilyDetails({Key? key}) : super(key: key);

  @override
  State<BscFamilyDetails> createState() => _BscFamilyDetailsState();
}

class _BscFamilyDetailsState extends State<BscFamilyDetails> {
  final _formKey = GlobalKey<FormState>();
  String mobileDecalaration = 'SE';
  String emailDecalaration = 'SE';
  Country? _currentSelectedValueMobile;
  Country? _currentSelectedValueForEmail;

  @override
  void initState() {
    context.read<BscCodeBloc>().add(BscCodeFetch());

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
        child: BlocConsumer<BscCodeBloc, BscCodeState>(
          listener: (context, state) {},
          builder: (context, bscstate) {
            print(bscstate.bscCodeModel?.data);

            return Container(
              height: SizeConfig.screenHeight,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!.familyDetails,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline3?.color,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.blockSizeHorizontal * 6),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          label: AppLocalizations.of(context)!.fathersName,
                          hint: AppLocalizations.of(context)!.fathersName,
                          controller: motherDateController,
                          tooltipActive: false,
                          onChange: (e) {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          label: AppLocalizations.of(context)!.mothersName,
                          hint: AppLocalizations.of(context)!.mothersName,
                          controller: fatherNameController,
                          tooltipActive: false,
                          onChange: (e) {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Mobile Declaration',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline3?.color,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: SizeConfig.blockSizeVertical * 9,
                          child: FormField<String>(
                            validator: (text) {
                              print(text);
                              if (mobileDecalaration == null) {
                                return 'Mobile Declaration can\'t be empty';
                              }

                              return null;
                            },
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 16.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Country>(
                                    onChanged: (newValue) {
                                      setState(() {
                                        _currentSelectedValueMobile = newValue!;
                                        mobileDecalaration =
                                            _currentSelectedValueMobile!.id;

                                        print(mobileDecalaration);
                                      });
                                    },
                                    hint: Text(
                                      "Self",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    value: _currentSelectedValueMobile,
                                    items: bscstate
                                        .bscCodeModel?.data.mobileDeclaration
                                        .map((value) {
                                      return DropdownMenuItem<Country>(
                                        value: value,
                                        child: Text(value.name),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Email Declaration',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.headline3?.color,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: SizeConfig.blockSizeVertical * 9,
                          child: FormField<String>(
                            validator: (text) {
                              if (emailDecalaration == null) {
                                return 'Email Declaration can\'t be empty';
                              }

                              return null;
                            },
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 16.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Country>(
                                    onChanged: (newValue) {
                                      setState(() {
                                        _currentSelectedValueForEmail =
                                            newValue!;
                                        emailDecalaration =
                                            _currentSelectedValueForEmail!.id;
                                      });
                                      print(emailDecalaration);
                                    },
                                    hint: Text(
                                      "Self",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    value: _currentSelectedValueForEmail,
                                    items: bscstate
                                        .bscCodeModel?.data.emailDeclaration
                                        .map((value) {
                                      return DropdownMenuItem<Country>(
                                        value: value,
                                        child: Text(value.name),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: MoneyPhiButton(
        buttonTitle: AppLocalizations.of(context)!.continueText,
        onClick: () => {
          RepositoryProvider.of<PartTwoOneModel>(context).fatherName =
              fatherNameController?.text,
          RepositoryProvider.of<PartTwoOneModel>(context).motherName =
              motherDateController?.text,
          RepositoryProvider.of<PartTwoOneModel>(context).emailDeclaration =
              emailDecalaration,
          RepositoryProvider.of<PartTwoOneModel>(context).mobileDeclaration =
              mobileDecalaration,
          if (_formKey.currentState!.validate())
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressDetails(),
                  ))
            }
        },
      ),
    );
  }
}
