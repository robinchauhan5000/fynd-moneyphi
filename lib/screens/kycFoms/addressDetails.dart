import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/screens/kycFoms/bsc_code_bloc/bsc_code_bloc.dart';
import 'package:moneyphi/screens/kycFoms/kyc_bloc/part_two_one/part_two_one_cubit.dart';
import 'package:moneyphi/screens/kycFoms/professionalDetails.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:moneyphi/widgets/customTextField.dart';
import 'package:moneyphi/widgets/money_button.dart';

import '../../Model/BscCodeDataModel.dart';
import '../../Model/KycFormModel/PartTwoOneModel.dart';

TextEditingController addressNameController = TextEditingController();
TextEditingController addressLine2Controller = TextEditingController();
TextEditingController pinCodeController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController stateController = TextEditingController();
TextEditingController countryController = TextEditingController();
String? preAddressType;
String? preState;
String? preCountry;

class AddressDetails extends StatefulWidget {
  const AddressDetails({Key? key}) : super(key: key);

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  Addrtype? _addresscurrentSelectedValue;
  late Country _statecurrentSelectedValue;
  late Country _countrycurrentSelectedValue;

  String addressTypeValue = preAddressType ?? "";
  String stateValue = preState ?? "";
  String countryValue = preCountry ?? "";

  static String _displayStringForOption(Country option) => option.name;

  @override
  void initState() {
    context.read<BscCodeBloc>().add(BscCodeFetch());
    print("BlocProvider.of<BscCodeBloc>(context).state");

    print("BlocProvider.of<BscCodeBloc>(context).state");
    print(preAddressType);

    if (preAddressType != null && preState != null && preCountry != null) {
      if (BlocProvider.of<BscCodeBloc>(context)
              .state
              .bscCodeModel
              ?.data
              .addrtype !=
          null) {
        // _addresscurrentSelectedValue = BlocProvider.of<BscCodeBloc>(context)
        //     .state
        //     .bscCodeModel
        //     ?.data
        //     .addrtype
        //     ;
        BlocProvider.of<BscCodeBloc>(context)
            .state
            .bscCodeModel
            ?.data
            .addrtype
            .forEach((element) {
          if (element.id == int.parse(preAddressType!)) {
            setState(() {
              _addresscurrentSelectedValue = element;
            });
          }
        });
        // _addresscurrentSelectedValue = BlocProvider.of<BscCodeBloc>(context)
        //     .state
        //     .bscCodeModel
        //     ?.data
        //     .addrtype
        //     .elementAt(int.parse(preAddressType!));
        // setState(() {
        //   print(_addresscurrentSelectedValue?.name);
        // });
        // }
      }

      if (BlocProvider.of<BscCodeBloc>(context)
              .state
              .bscCodeModel!
              .data
              .states !=
          null) {
        _statecurrentSelectedValue = BlocProvider.of<BscCodeBloc>(context)
            .state
            .bscCodeModel!
            .data
            .states
            .where((element) => element.id == preState)
            .toList()
            .first;
      }

      if (BlocProvider.of<BscCodeBloc>(context)
              .state
              .bscCodeModel!
              .data
              .country !=
          null) {
        _countrycurrentSelectedValue = BlocProvider.of<BscCodeBloc>(context)
            .state
            .bscCodeModel!
            .data
            .country
            .where((element) => element.name == preCountry)
            .toList()
            .first;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: BlocConsumer<BscCodeBloc, BscCodeState>(
                listener: (context, state) {},
                builder: (context, bscstate) {
                  print(bscstate.bscCodeModel?.data.addrtype.first);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!.addressDetails,
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline3?.color,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockSizeHorizontal * 6),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: SizeConfig.blockSizeVertical * 9,
                        child: FormField<String>(
                          validator: (value) {
                            if (addressTypeValue == '') {
                              return 'Please select address type';
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
                                  hint: Text("Please select address type"),
                                  onChanged: (newValue) {
                                    setState(() {
                                      _addresscurrentSelectedValue?.name =
                                          newValue!;

                                      addressTypeValue =
                                          _addresscurrentSelectedValue!.id
                                              .toString();
                                    });
                                  },
                                  value: _addresscurrentSelectedValue?.name,
                                  items: bscstate.bscCodeModel?.data.addrtype
                                      .map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.name,
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
                        height: 30,
                      ),
                      CustomTextField(
                        label: AppLocalizations.of(context)!.addressDetails,
                        hint: AppLocalizations.of(context)!.addressDetails,
                        controller: addressNameController,
                        maxLength: 50,
                        tooltipActive: false,
                        onChange: (e) {},
                      ),
                      CustomTextField(
                        label: 'Address Line 2',
                        hint: AppLocalizations.of(context)!.addressDetails,
                        controller: addressLine2Controller,
                        maxLength: 50,
                        tooltipActive: false,
                        onChange: (e) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        label: AppLocalizations.of(context)!.pincode,
                        hint: AppLocalizations.of(context)!.pincode,
                        controller: pinCodeController,
                        tooltipActive: false,
                        onChange: (e) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        label: AppLocalizations.of(context)!.city,
                        hint: AppLocalizations.of(context)!.city,
                        controller: cityController,
                        tooltipActive: false,
                        onChange: (e) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!.state,
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
                          return bscstate.bscCodeModel!.data.states
                              .where((Country option) {
                            return option.name
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase());
                          });
                        },
                        onSelected: (Country selection) {
                          setState(() {
                            stateValue = selection.id.toString();
                          });
                        },
                        initialValue: TextEditingValue(
                            text: _statecurrentSelectedValue.name),
                        fieldViewBuilder: (context, controller, focusNode,
                            onEditingComplete) {
                          // controller.text = _statecurrentSelectedValue.name;

                          return TextFormField(
                            validator: (value) {
                              if (stateValue == '') {
                                return 'Please Select State';
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
                              hintText: "Select State",
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.of(context)!.country,
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
                        initialValue: TextEditingValue(
                            text: _countrycurrentSelectedValue.name),
                        onSelected: (Country selection) {
                          setState(() {
                            countryValue = selection.id.toString();
                          });
                        },
                        fieldViewBuilder: (context, controller, focusNode,
                            onEditingComplete) {
                          // controller.text = _countrycurrentSelectedValue.name;

                          return TextFormField(
                            validator: (value) {
                              if (countryValue == '') {
                                return 'Please Select Country';
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
                              hintText: "Select Country",
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        bottomNavigationBar: BlocConsumer<PartTwoOneCubit, PartTwoOneState>(
          listener: (context, state) {
            if (state.partTwoOneStaus == PartTwoOneStaus.successful) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfessionDetails(),
                ),
              );
            }
            if (state.partTwoOneStaus == PartTwoOneStaus.error) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error!)));
            }
          },
          builder: (context, state) {
            return MoneyButton(
              textWidet: (state.partTwoOneStaus == PartTwoOneStaus.loading)
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      AppLocalizations.of(context)!.continueText,
                      style: TextStyle(color: Colors.white),
                    ),
              onClick: () => {
                RepositoryProvider.of<PartTwoOneModel>(context).addrType =
                    addressTypeValue,
                RepositoryProvider.of<PartTwoOneModel>(context).paddr1 =
                    addressNameController.text,
                RepositoryProvider.of<PartTwoOneModel>(context).paddr2 =
                    addressLine2Controller.text,
                RepositoryProvider.of<PartTwoOneModel>(context).ppincode =
                    pinCodeController.text,
                RepositoryProvider.of<PartTwoOneModel>(context).pcity =
                    cityController.text,
                RepositoryProvider.of<PartTwoOneModel>(context).pstate =
                    stateValue,
                RepositoryProvider.of<PartTwoOneModel>(context).pcountry =
                    countryValue,
                context.read<PartTwoOneCubit>().postPartTwoOneKyc(
                    RepositoryProvider.of<PartTwoOneModel>(context)),
              },
            );
          },
        ));
  }
}
