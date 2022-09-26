import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:moneyphi/Model/KycFormModel/PartTwoThreeModel.dart';
import 'package:moneyphi/screens/kycFoms/kyc_bloc/part_two_three/part_two_three_cubit.dart';
import 'package:moneyphi/utils/AppSnackBar.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:moneyphi/widgets/customTextField.dart';
import 'package:moneyphi/widgets/moneyPhiButton.dart';

import '../../Model/KycFormModel/PartTwoOneModel.dart';
import 'bankDetails.dart';
import 'bscPersonalDetails.dart';

TextEditingController? nomineeNameCodeController = TextEditingController();
TextEditingController? guardianController = TextEditingController();
TextEditingController dobNominee = TextEditingController();
String? preNomineeRelation;

class NomineeDetails extends StatefulWidget {
  const NomineeDetails({Key? key}) : super(key: key);

  @override
  State<NomineeDetails> createState() => _NomineeDetailsState();
}

class _NomineeDetailsState extends State<NomineeDetails> {
  DateTime selectedDob = DateTime.now();
  var _Relation = [
    "Mother",
    "Brother",
    "Sister",
    "Father",
  ];

  String _currentSelectedValue = preNomineeRelation!;

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   nomineeNameCodeController?.dispose();
  //   guardianController?.dispose();
  //
  //   super.dispose();
  // }
  bool isAdultValue = false;
  PartTwoThreeModel? model;
  var dobMain;
  final _formKey = GlobalKey<FormState>();

  isAdult() {
    String datePattern = "dd-MM-yyyy";

    DateTime birthDate =
        DateTime.parse(RepositoryProvider.of<PartTwoOneModel>(context).dob!);

    setState(() {
      dobMain = birthDate;
    });
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;

    if (yearDiff >= 18) {
      setState(() {
        isAdultValue = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('dobNominee');
    print(dobMain);
    print('dobNominee');
    print(dob!.text);
    print('dobNominee');
    print(dobNominee.text);
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
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Container(
              height: SizeConfig.screenHeight,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!.nomineeDetails,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline3?.color,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockSizeHorizontal * 6),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    label: AppLocalizations.of(context)!.nomineeName,
                    hint: AppLocalizations.of(context)!.nomineeName,
                    controller: nomineeNameCodeController,
                    tooltipActive: false,
                    onChange: (e) {
                      print(e);
                    },
                  ),
                  isAdultValue
                      ? SizedBox(
                          height: 10,
                        )
                      : Container(),
                  Visibility(
                    visible: isAdultValue,
                    child: CustomTextField(
                      label: "Guardian",
                      hint: "Guardian",
                      controller: guardianController,
                      tooltipActive: false,
                      onChange: (e) {
                        print(e);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  dateTimeFormField(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 9,
                    child: FormField<String>(
                      validator: (text) {
                        if (text == null) {
                          return 'Please select date';
                        }

                        return null;
                      },
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 16.0),
                              hintText: 'Please Select',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("Please select Relation type"),
                              onChanged: (newValue) {
                                setState(() {
                                  _currentSelectedValue = newValue!;
                                });
                              },
                              value: _currentSelectedValue.isNotEmpty
                                  ? _currentSelectedValue
                                  : null,
                              items: _Relation.map((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocConsumer<PartTwoThreeCubit, PartTwoThreeState>(
        listener: (context, state) {
          if (state.partTwoThreeStaus == PartTwoThreeStaus.successful) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BankDetails(),
              ),
            );
          }

          if (state.partTwoThreeStaus == PartTwoThreeStaus.error) {
            appSnackBar(content: state.error, context: context);
          }
        },
        builder: (context, state) {
          return MoneyPhiButton(
            buttonTitle: AppLocalizations.of(context)!.continueText,
            onClick: () => {
              model = PartTwoThreeModel(
                  nomineeName: nomineeNameCodeController!.text,
                  nomineeRelation: _currentSelectedValue,
                  nomineeDob: DateTime.parse(dobNominee.text),
                  nomineeGuardian: guardianController!.text),
              context.read<PartTwoThreeCubit>().postPartTwoOneKyc(model!),
            },
          );
        },
      ),
    );
  }

  dateTimeFormField() {
    return Container(
      height: 70,
      child: TextFormField(
        validator: (text) {
          if (text == null) {
            return 'Please select data';
          }

          return null;
        },
        onTap: _selectDate,
        controller: dobNominee,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.black, width: 8),
          ),
          hintText: "Date of birth",
          labelStyle: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
          prefixIcon: Icon(
            Icons.calendar_today_outlined,
            color: appColorPrimary,
            size: 20,
          ),
        ),
      ),
    );
  }

  _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null) {
      var datetime = picked;
      //assign the chosen date to the controller
      dobNominee.text = DateFormat.yMd().format(datetime);
    }
  }
}
