import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:moneyphi/Model/CountryListDataModel.dart';
import 'package:moneyphi/Model/GetProfileModel.dart';
import 'package:moneyphi/Model/KycFormModel/PartTwoOneModel.dart';
import 'package:moneyphi/screens/kycFoms/bscFamilyDetails.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:moneyphi/widgets/customTextField.dart';
import 'package:moneyphi/widgets/moneyPhiButton.dart';

TextEditingController? firstNameController = TextEditingController();
TextEditingController? lastNameController = TextEditingController();
TextEditingController? dob = TextEditingController();

String? preGender;
List<bool> genderSelectionList = [false, false, false];

class BSCPersonDetails extends StatefulWidget {
  const BSCPersonDetails({Key? key}) : super(key: key);

  @override
  State<BSCPersonDetails> createState() => _BSCPersonDetailsState();
}

class _BSCPersonDetailsState extends State<BSCPersonDetails> {
  DateTime selectedDob = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  List<bool> martialStatusList = [false, false];
  String genderValue = '';
  String martialStatusValue = '';
  GetProfileModel? getProfileModel;

  @override
  void initState() {
    if (preGender == "M") {
      setState(() {
        genderSelectionList[0] = true;
        genderSelectionList[1] = false;
        genderSelectionList[2] = false;
        genderValue = "M";
      });
    } else if (preGender == "F") {
      setState(() {
        genderSelectionList[0] = false;
        genderSelectionList[1] = true;
        genderSelectionList[2] = false;
        genderValue = "F";
      });
    } else if (preGender == "O") {
      setState(() {
        genderSelectionList[0] = false;
        genderSelectionList[1] = false;
        genderSelectionList[2] = true;
        genderValue = "O";
      });
    }
    super.initState();
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: SizeConfig.screenHeight,
            margin: EdgeInsets.only(left: 30, right: 30),
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
                        AppLocalizations.of(context)!.personalInformation,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline3?.color,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 6),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                          label: AppLocalizations.of(context)!.firstName,
                          hint: AppLocalizations.of(context)!.firstName,
                          controller: firstNameController,
                          tooltipActive: true,
                          onChange: (e) {},
                          tooltipMessage: 'jjjjjjjjjjjjjjjjjjjjjjjj'),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                          label: AppLocalizations.of(context)!.lastName,
                          hint: AppLocalizations.of(context)!.lastName,
                          controller: lastNameController,
                          tooltipActive: true,
                          onChange: (e) {},
                          tooltipMessage: 'jjjjjjjjjjjjjjjjjjjjjjjj'),
                      SizedBox(
                        height: 10,
                      ),
                      genderSelection(isSelected: genderSelectionList),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Date of birth',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      dateTimeFormField(),
                      SizedBox(
                        height: 15,
                      ),
                      // martialStatus(martialStatus: martialStatusList),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: MoneyPhiButton(
        buttonTitle: AppLocalizations.of(context)!.continueText,
        onClick: () => {
          RepositoryProvider.of<PartTwoOneModel>(context).fName =
              firstNameController?.text,
          RepositoryProvider.of<PartTwoOneModel>(context).lName =
              lastNameController?.text,
          RepositoryProvider.of<PartTwoOneModel>(context).gender = genderValue,
          RepositoryProvider.of<PartTwoOneModel>(context).dob = dob?.text,
          if (_formKey.currentState!.validate())
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BscFamilyDetails(),
                ),
              ),
            }
        },
      ),
    );
  }

  genderSelection({
    required List<bool> isSelected,
  }) {
    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.gender,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.headline3?.color,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected[0] = true;
                    isSelected[1] = false;
                    isSelected[2] = false;
                    genderValue = "M";
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 15,
                    width: SizeConfig.blockSizeHorizontal * 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: appColorPrimary),
                        color: isSelected[0] ? appColorPrimary : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.male,
                      style: TextStyle(
                          color: isSelected[0] ? Colors.white : fontGrey),
                    ))),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected[0] = false;
                    isSelected[1] = true;
                    isSelected[2] = false;
                    genderValue = "F";
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 15,
                    width: SizeConfig.blockSizeHorizontal * 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: appColorPrimary),
                        color: isSelected[1] ? appColorPrimary : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.female,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isSelected[1] ? Colors.white : fontGrey),
                    ))),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected[0] = false;
                    isSelected[1] = false;
                    isSelected[2] = true;
                    genderValue = "O";
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 15,
                    width: SizeConfig.blockSizeHorizontal * 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: appColorPrimary),
                        color: isSelected[2] ? appColorPrimary : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.others,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isSelected[2] ? Colors.white : fontGrey),
                    ))),
          ],
        ),
      ],
    );
  }

  martialStatus({List<bool>? martialStatus}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.maritalStatus,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.headline3?.color,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    martialStatus![0] = true;
                    martialStatus[1] = false;
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 15,
                    width: SizeConfig.blockSizeHorizontal * 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: appColorPrimary),
                        color:
                            martialStatus![0] ? appColorPrimary : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.single,
                      style: TextStyle(
                          color: martialStatus[0] ? Colors.white : fontGrey),
                    ))),
            GestureDetector(
                onTap: () {
                  setState(() {
                    martialStatus[0] = false;
                    martialStatus[1] = true;
                  });
                },
                child: Container(
                    height: SizeConfig.blockSizeHorizontal * 15,
                    width: SizeConfig.blockSizeHorizontal * 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: appColorPrimary),
                        color:
                            martialStatus[1] ? appColorPrimary : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.married,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: martialStatus[1] ? Colors.white : fontGrey),
                    ))),
          ],
        ),
      ],
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
        //     (BuildContext context, DateTime? currentValue) async {
        //   final datePicked = await getDate(context);
        //   if (datePicked != null) {
        //     print(datePicked);
        //     setState(() {
        //       dob = TextEditingController(
        //           text: datePicked.toString().substring(0, 10));
        //       //dobController.text = DateFormat('yyyy-MM-dd').format(datePicked);
        //       return datePicked;
        //     });
        //   }
        // },
        controller: dob,
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

  getDate(BuildContext context, {DateTime? date}) async {
    final datePicked = await showDatePicker(
        context: context,
        firstDate: DateTime(1947, 4),
        initialDate: date ?? DateTime.now(),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDatePickerMode: DatePickerMode.day);
    return datePicked;
  }

  static String? _displayStringForOption(CountryDataModel option) =>
      option.name;

  autoCompleteCountry(List<CountryDataModel> listOfCountry) {
    return Autocomplete<CountryDataModel>(
      // displayStringForOption: (CountryDataModel option) => option.name,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<CountryDataModel>.empty();
        }
        return listOfCountry.where((CountryDataModel option) {
          return option
              .toString()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (CountryDataModel selection) {
        debugPrint('You just selected ${selection.name}');
      },
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
      dob!.text = DateFormat.yMd().format(datetime);
    }
  }
}
