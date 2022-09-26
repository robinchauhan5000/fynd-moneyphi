import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:moneyphi/Model/SIgnUpModel.dart';
import 'package:moneyphi/controller/signUpController.dart';
import 'package:moneyphi/screens/NavigatonBar/BottomNavigation.dart';
import 'package:moneyphi/screens/login/login_screen.dart';
import 'package:moneyphi/utils/AppSnackBar.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../controller/SignUpRepo.dart';
import 'bloc/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController? signUpController;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cPass = TextEditingController();
  SignupApiModel? signupApiModel;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    signUpController = Provider.of<SignUpController>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: RepositoryProvider(
            create: (context) => SignUpRepo(),
            child: BlocProvider(
              create: (context) => SignUpBloc(
                  signUpRepo: RepositoryProvider.of<SignUpRepo>(context)),
              child: BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  if (state.signUpStatus == SignUpStatus.successful) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBarV2()));
                  }
                  if (state.signUpStatus == SignUpStatus.error) {
                    appSnackBar(content: state.apiError, context: context);
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 6),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('A few details and we are set to go'),
                            ],
                          ),
                        ),
                        customTextField(
                            icon: Icons.person,
                            label: 'Name',
                            hint: 'Full name',
                            controller: name),
                        customTextField(
                            icon: Icons.person,
                            controller: email,
                            label: 'Email ID',
                            hint: 'example@mail.com'),
                        Container(
                          width: SizeConfig.screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                margin: EdgeInsets.only(top: 10, left: 30),
                                width: 120,
                                height: 60,
                                child: CountryCodePicker(
                                    padding: EdgeInsets.zero,
                                    onChanged: print,
                                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                    initialSelection: 'IN',
                                    favorite: ['+91', 'IN'],
                                    showFlagDialog: true,
                                    showDropDownButton: true,
                                    comparator: (a, b) =>
                                        b.name!.compareTo(a.name!),
                                    //Get the country information relevant to the initial selection
                                    onInit: (code) {}),
                              ),
                              Expanded(
                                child: customTextField(
                                    icon: Icons.phone,
                                    hint: '9876543210',
                                    controller: mobile),
                              )
                            ],
                          ),
                        ),
                        customTextField(
                            icon: Icons.lock_outline,
                            label: 'Password',
                            hint: 'Password',
                            controller: pass),
                        customTextField(
                            icon: Icons.lock_outline,
                            label: 'Confirm Password',
                            controller: cPass,
                            hint: 'Password'),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(appButtonColor),
                              fixedSize: MaterialStateProperty.all(Size(
                                  SizeConfig.screenWidth * 0.50,
                                  SizeConfig.screenHeight * 0.05)),
                            ),
                            onPressed: () async {
                              var data = await signUpController!.signUpApi(
                                  email: email.text,
                                  pass: pass.text,
                                  name: name.text,
                                  phone: mobile.text,
                                  context: context);
                              // context.read<SignUpBloc>().add(
                              //     SignUpFormSubmitEvent(
                              //         email: email.text,
                              //         confirmPassword: pass.text,
                              //         password: pass.text,
                              //         phoneNmber: mobile.text));
                              // if (_key.currentState!.validate()) {
                              //
                              // }
                              // (state.signUpStatus == SignUpStatus.loading)
                            },
                            child: signUpController!.isLoading
                                ? CircularProgressIndicator()
                                : Text('Submit'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: ("By Proceeding you "),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              WidgetSpan(
                                  child: Text(
                                      "Agree to Terms & Conditions and Policies",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.underline)))
                            ]),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: ("Already Have An Account ? "),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              WidgetSpan(
                                  child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Text("Login",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        decoration: TextDecoration.underline)),
                              ))
                            ]),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  customTextField(
      {String? label,
      String? hint,
      IconData? icon,
      bool? passwordType = false,
      TextInputType? textInputType,
      TextEditingController? controller}) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        alignment: Alignment.center,
        child: TextFormField(
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Can\'t be empty';
            }
            if (text.length < 4) {
              return 'Too short';
            }
            return null;
          },
          controller: controller,
          keyboardType: label == "Email ID"
              ? TextInputType.name
              : label == "Name"
                  ? TextInputType.name
                  : hint == "9876543210"
                      ? TextInputType.phone
                      : TextInputType.text,
          obscureText: passwordType ?? false,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white70,
            border: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
