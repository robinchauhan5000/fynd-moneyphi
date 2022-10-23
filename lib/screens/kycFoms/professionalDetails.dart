import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/Model/BscCodeDataModel.dart';
import 'package:moneyphi/Model/KycFormModel/PartTwoTwoModel.dart';
import 'package:moneyphi/screens/kycFoms/bsc_code_bloc/bsc_code_bloc.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:moneyphi/widgets/customTextField.dart';
import 'package:moneyphi/widgets/moneyPhiButton.dart';

import 'fectaDetails.dart';

TextEditingController? incomeController = TextEditingController();
TextEditingController? birthPlaceController = TextEditingController();
TextEditingController? birthCountryController = TextEditingController();

String? preBirthCountry;
String? preOccupation;

class ProfessionDetails extends StatefulWidget {
  const ProfessionDetails({Key? key}) : super(key: key);

  @override
  State<ProfessionDetails> createState() => _ProfessionDetailsState();
}

class _ProfessionDetailsState extends State<ProfessionDetails> {
  String occupationValue = "";
  String birthCountryalue = "";

  final _formKey = GlobalKey<FormState>();

  Country? _occupationCurrentSelectedValue;
  Country? _birthCountryCurrentSelectedValue;

  @override
  void initState() {
    print("preOccupation");
    print(preOccupation);
    print("preBirthCountry");
    print(preBirthCountry);
    BscCodeBloc bscCodeBloc;
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        occupationValue = preOccupation!;
        birthCountryalue = preBirthCountry!;
        birthCountryController = TextEditingController(text: preBirthCountry!);
        bscCodeBloc = BlocProvider.of<BscCodeBloc>(context);
        bscCodeBloc.state.bscCodeModel?.data.occupation.forEach((element) {
          if (preOccupation == element.id) {
            _occupationCurrentSelectedValue = element;
          }
        });
      });
    });

    setState(() {});
    // if (preBirthCountry != null || preOccupation != null) {
    //   _occupationCurrentSelectedValue = BlocProvider.of<BscCodeBloc>(context)
    //       .state
    //       .bscCodeModel
    //       ?.data
    //       .occupation
    //       .where((element) => element.id == preOccupation)
    //       .toList()
    //       .first;
    //
    //   _birthCountryCurrentSelectedValue = BlocProvider.of<BscCodeBloc>(context)
    //       .state
    //       .bscCodeModel!
    //       .data
    //       .country
    //       .where((element) => element.id == preBirthCountry)
    //       .toList()
    //       .first;
    // }
    super.initState();
  }

  // @override
  // void initState() {
  //   if (preBirthCountry != null || preOccupation != null) {
  //     _occupationCurrentSelectedValue = BlocProvider.of<BscCodeBloc>(context)
  //         .state
  //         .bscCodeModel
  //         ?.data
  //         .occupation
  //         .where((element) => element.id == preOccupation)
  //         .toList()
  //         .first;
  //
  //     _birthCountryCurrentSelectedValue = BlocProvider.of<BscCodeBloc>(context)
  //         .state
  //         .bscCodeModel!
  //         .data
  //         .country
  //         .where((element) => element.id == preBirthCountry)
  //         .toList()
  //         .first;
  //   }
  //   super.initState();
  // }

  static String _displayStringForOption(Country option) => option.name;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print("birthCountryController?.text");
    print(birthCountryController?.text);
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
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: BlocConsumer<BscCodeBloc, BscCodeState>(
              listener: (context, state) {},
              builder: (context, bscstate) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!.professionalDetails,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline3?.color,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 6),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        AppLocalizations.of(context)!.occupationDetails,
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
                            if (occupationValue == null ||
                                occupationValue.isEmpty) {
                              return 'Occupation Type can\'t be empty';
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
                                child: DropdownButton<Country>(
                                  hint: Text("Please select occupation type"),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _occupationCurrentSelectedValue =
                                          newValue!;
                                      occupationValue =
                                          _occupationCurrentSelectedValue!.id;
                                    });
                                  },
                                  value: _occupationCurrentSelectedValue,
                                  items: bscstate.bscCodeModel?.data.occupation
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
                      CustomTextField(
                        label: AppLocalizations.of(context)!.birthPlace,
                        hint: AppLocalizations.of(context)!.birthPlace,
                        controller: birthPlaceController,
                        tooltipActive: false,
                        onChange: (e) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!.birthCountry,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.headline3?.color,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Autocomplete<Country>(
                        displayStringForOption: _displayStringForOption,
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          return bscstate.bscCodeModel!.data.country
                              .where((Country option) {
                            return option.name
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase());
                          });
                        },
                        onSelected: (Country selection) {
                          setState(() {
                            birthCountryalue = selection.id.toString();
                          });
                        },
                        initialValue:
                            TextEditingValue(text: preBirthCountry ?? ""),
                        fieldViewBuilder: (context, controller, focusNode,
                            onEditingComplete) {
                          birthCountryController = controller;

                          return TextFormField(
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Please Select Birth Country';
                              }
                              return null;
                            },
                            controller: controller,
                            focusNode: focusNode,
                            onEditingComplete: onEditingComplete,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white70,
                              border: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Select Birth Country",
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: MoneyPhiButton(
        buttonTitle: AppLocalizations.of(context)!.continueText,
        onClick: () => {
          RepositoryProvider.of<PartTwoTwoModel>(context).occupation =
              occupationValue,
          RepositoryProvider.of<PartTwoTwoModel>(context).birthCountry =
              birthCountryalue,
          RepositoryProvider.of<PartTwoTwoModel>(context).birthPlace =
              birthPlaceController?.text,
          RepositoryProvider.of<PartTwoTwoModel>(context).incSlab = '31',
          RepositoryProvider.of<PartTwoTwoModel>(context).sourceWealth = '01',
          print(_formKey.currentState!.validate()),
          print(
              occupationValue + birthCountryalue + birthPlaceController!.text),
          if (_formKey.currentState!.validate())
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FectaDetails(),
                ),
              ),
            }
        },
      ),
    );
  }
}
