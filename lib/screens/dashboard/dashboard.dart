import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/Model/GetProfileModel.dart';
import 'package:moneyphi/controller/BankDetailsController.dart';
import 'package:moneyphi/controller/LocaleProvider.dart';
import 'package:moneyphi/screens/cart_page/cart_page_list.dart';
import 'package:moneyphi/screens/create_goals/create_goals.dart';
import 'package:moneyphi/screens/kycFoms/panCardFormScreen.dart';
import 'package:moneyphi/screens/mutual_funds/iam_beginner/IAmBiggnerScreen.dart';
import 'package:moneyphi/screens/profile/main_profile.dart';
import 'package:moneyphi/theme/bloc/theme_cubit.dart';
import 'package:moneyphi/theme/theme.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../controller/dashBoardController.dart';
import '../../default_data.dart';
import '../kycFoms/addressDetails.dart';
import '../kycFoms/bscFamilyDetails.dart';
import '../kycFoms/bscPersonalDetails.dart';
import '../kycFoms/nomineeDetails.dart';
import '../kycFoms/professionalDetails.dart';

GetProfileModel? getProfileModel;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DefaultData defaultData = DefaultData();
  DashBoardController? dashboardController;
  KYCController? kycController;
  var data;
  var dashboardData;
  @override
  void initState() {
    dashboardController =
        Provider.of<DashBoardController>(context, listen: false);
    kycController = Provider.of<KYCController>(context, listen: false);
    data = dashboardController!.getUserProfile(context);
    dashboardData = dashboardController!.getDashboard(context);
    dashboardController!.getCartCount(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var language = Provider.of<AppLocale>(context, listen: false);
    return Consumer<DashBoardController>(
      builder: (context, profile, child) {
        if (profile.getProfileModel != null ||
            profile.getProfileModel?.isKycDone == 1 ||
            profile.getProfileModel?.isFactaDone == 1 ||
            profile.getProfileModel?.isBseClientCreated == 1 ||
            profile.getProfileModel?.kycStatus == "done") {
          panNumberController =
              TextEditingController(text: profile.getProfileModel!.pan);
          preGender = profile.getProfileModel!.gender;
          preAddressType = profile.getProfileModel!.addrType;
          preState = profile.getProfileModel!.state;
          preCountry = profile.getProfileModel!.country;

          birthPlaceController =
              TextEditingController(text: profile.getProfileModel!.birthPlace);
          preBirthCountry = profile.getProfileModel!.birthCountry;
          preOccupation = profile.getProfileModel!.occupation;

          fatherNameController =
              TextEditingController(text: profile.getProfileModel!.fatherName);
          motherDateController =
              TextEditingController(text: profile.getProfileModel!.motherName);
          firstNameController =
              TextEditingController(text: profile.getProfileModel!.fName);
          lastNameController =
              TextEditingController(text: profile.getProfileModel?.lName ?? '');
          dob = profile.getProfileModel!.dob != null
              ? TextEditingController(
                  text: (profile.getProfileModel!.dob.toString()).toString())
              : TextEditingController(text: "");

          kycController?.accountNumberController = TextEditingController(
              text: profile.getProfileModel?.accNo1 ?? "");
          kycController?.reaccountNumberController = TextEditingController(
              text: profile.getProfileModel?.accNo1 ?? "");
          kycController?.bankNameController = TextEditingController(
              text: profile.getProfileModel?.bankName1 ?? "");
          kycController?.branchNameController = TextEditingController(
              text: profile.getProfileModel?.bankBranch1.toString() ?? "");
          kycController?.ifscCodeController = TextEditingController(
              text: profile.getProfileModel?.ifscCode1.toString() ?? "");

          addressNameController =
              TextEditingController(text: profile.getProfileModel!.addr1);
          addressLine2Controller =
              TextEditingController(text: profile.getProfileModel!.addr2);
          pinCodeController =
              TextEditingController(text: profile.getProfileModel!.pincode);
          cityController =
              TextEditingController(text: profile.getProfileModel!.city);
          // stateController = TextEditingController(text: profile.getProfileModel!.state);
          // countryController = TextEditingController(text: profile.getProfileModel!.country);
          nomineeNameCodeController =
              TextEditingController(text: profile.getProfileModel!.nominee);
          preNomineeRelation = profile.getProfileModel!.nomineeRelation;

          dobNominee = TextEditingController(
              text: profile.getProfileModel!.nomineeDob.toString().toString());

          incomeController = TextEditingController();
          birthPlaceController =
              TextEditingController(text: profile.getProfileModel!.birthPlace);

          dobNominee = profile.getProfileModel!.nomineeDob != null
              ? TextEditingController(
                  text:
                      profile.getProfileModel!.nomineeDob.toString().toString())
              : TextEditingController();

          guardianController = TextEditingController(
              text: profile.getProfileModel!.nomineeGuardian);
        }
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: profile.isLoading!
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.45,
                            ),
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        )
                      : Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 15, bottom: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppBar(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                title: Text(
                                  profile.getProfileModel == null
                                      ? "Hi"
                                      : 'Hi,${profile.getProfileModel?.panName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(fontSize: 14),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MainProfile()))
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffF5EEE5)),
                                          child: Icon(
                                            Icons.person,
                                            size: 50,
                                            color: Color(0xffF2CEA5),
                                          ),
                                        ),
                                      ),
                                      profile.cartCount == 0
                                          ? Container()
                                          : GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CartPageList()));
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 20),
                                                child: Badge(
                                                    animationType:
                                                        BadgeAnimationType
                                                            .slide,
                                                    badgeContent: Text(
                                                      profile.cartCount
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .shopping_cart_rounded,
                                                      size: 30,
                                                      color: Colors.grey,
                                                    )),
                                              ),
                                            ),
                                      // CircleAvatar(
                                      //   child:
                                      //       Text(profile.cartCount.toString()),
                                      // ),
                                      // Container(
                                      //   width: 100,
                                      //   padding: EdgeInsets.only(
                                      //       left: 10, right: 10),
                                      //   alignment: Alignment.centerLeft,
                                      //   decoration: BoxDecoration(
                                      //     color: Colors.indigo,
                                      //     borderRadius:
                                      //         BorderRadius.circular(2),
                                      //   ),
                                      //   child: DropdownButton<String>(
                                      //     value: language.locale.toString() ==
                                      //             "en"
                                      //         ? "English"
                                      //         : language.locale.toString() ==
                                      //                 "hi"
                                      //             ? "Hindi"
                                      //             : "Gujarati",
                                      //     icon: Icon(
                                      //       Icons.arrow_downward,
                                      //       color: Colors.white,
                                      //     ),
                                      //     iconSize: 20,
                                      //     elevation: 0,
                                      //     style: TextStyle(color: Colors.white),
                                      //     underline: Container(
                                      //       height: 1,
                                      //     ),
                                      //     dropdownColor: Colors.indigo,
                                      //     onChanged: (String? newValue) {
                                      //       language.changeLocale(newValue);
                                      //     },
                                      //     items: defaultData
                                      //         .languagesListDefault
                                      //         .map<DropdownMenuItem<String>>(
                                      //       (String value) {
                                      //         return DropdownMenuItem<String>(
                                      //           value: value,
                                      //           child: Text(value),
                                      //         );
                                      //       },
                                      //     ).toList(),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                              BlocBuilder<ThemeCubit, ThemeState>(
                                builder: (context, state) {
                                  return Switch(
                                      value: state.isDarkThemeOn,
                                      onChanged: (value) {
                                        print(state.isDarkThemeOn);
                                        context
                                            .read<ThemeCubit>()
                                            .globalTheme(isDarkTheme: value);
                                      });
                                },
                              ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // investmentValueCard(),
                              profile.getProfileModel != null &&
                                      profile.getProfileModel!.isKycDone == 1 &&
                                      profile.getProfileModel!.isFactaDone ==
                                          1 &&
                                      profile.getProfileModel!
                                              .isBseClientCreated ==
                                          1 &&
                                      profile.getProfileModel!.kycStatus ==
                                          "done"
                                  ? Container()
                                  : const SizedBox(
                                      height: 20,
                                    ),
                              profile.getProfileModel != null &&
                                      profile.getProfileModel!.isKycDone == 1 &&
                                      profile.getProfileModel!.isFactaDone ==
                                          1 &&
                                      profile.getProfileModel!
                                              .isBseClientCreated ==
                                          1 &&
                                      profile.getProfileModel!.kycStatus ==
                                          "done"
                                  ? Container()
                                  : Text(
                                      AppLocalizations.of(context)!
                                          .onboardyourjourney,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline3
                                            ?.color,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 5,
                                      ),
                                    ),
                              const SizedBox(
                                height: 10,
                              ),
                              profile.getProfileModel != null &&
                                      profile.getProfileModel!.isKycDone == 1 &&
                                      profile.getProfileModel!.isFactaDone ==
                                          1 &&
                                      profile.getProfileModel!
                                              .isBseClientCreated ==
                                          1 &&
                                      profile.getProfileModel!.kycStatus ==
                                          "done"
                                  ? Container()
                                  : onBoardJourney(),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .letyourmoneyworkforyou,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        ?.color,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 5,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: SizeConfig.screenWidth,
                                height: SizeConfig.blockSizeVertical * 20,
                                child: ListView(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreateGoalsScreen()));
                                      },
                                      child: categoreyCard(
                                        assetPath:
                                            'assets/icons8-goal-64 1.png',
                                        textName: AppLocalizations.of(context)!
                                            .createGoals,
                                      ),
                                    ),
                                    categoreyCard(
                                      assetPath:
                                          'assets/icons8-money-box-96 2.png',
                                      textName: AppLocalizations.of(context)!
                                          .startaSIP,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    IAmBeginnerScreen()));
                                      },
                                      child: categoreyCard(
                                        assetPath:
                                            'assets/icons8-garden-96 1.png',
                                        textName: AppLocalizations.of(context)!
                                            .iamabeginner,
                                      ),
                                    ),
                                    categoreyCard(
                                      assetPath:
                                          'assets/icons8-gold-bars-96 1.png',
                                      textName: AppLocalizations.of(context)!
                                          .investinDigitalGold,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 6),
                                child: Text(
                                  AppLocalizations.of(context)!.learnwithphi,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        ?.color,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 5,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: SizeConfig.screenWidth,
                                height: SizeConfig.blockSizeVertical * 20,
                                child: ListView(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    categoreyCard(
                                      assetPath: 'assets/icons8-goal-64 1.png',
                                      textName: AppLocalizations.of(context)!
                                          .createGoals,
                                    ),
                                    categoreyCard(
                                      assetPath:
                                          'assets/icons8-money-box-96 2.png',
                                      textName: AppLocalizations.of(context)!
                                          .startaSIP,
                                    ),
                                    categoreyCard(
                                      assetPath:
                                          'assets/icons8-garden-96 1.png',
                                      textName: AppLocalizations.of(context)!
                                          .iamabeginner,
                                    ),
                                    categoreyCard(
                                      assetPath:
                                          'assets/icons8-gold-bars-96 1.png',
                                      textName: AppLocalizations.of(context)!
                                          .investinDigitalGold,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              profile.getProfileModel != null &&
                                      profile.getProfileModel!.isKycDone == 1 &&
                                      profile.getProfileModel!.isFactaDone ==
                                          1 &&
                                      profile.getProfileModel!
                                              .isBseClientCreated ==
                                          1 &&
                                      profile.getProfileModel!.kycStatus ==
                                          "done"
                                  ? Container()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 6),
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .setupyouraccount,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .headline3
                                                    ?.color,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18),
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              padding:
                                                  MaterialStateProperty.all(
                                                EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 20),
                                              ),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0)),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      appColorPrimary)),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PanCardFormScreen(),
                                              ),
                                            );
                                          },
                                          child: Center(
                                              child: Text(
                                            AppLocalizations.of(context)!
                                                .clickhere,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )),
                                        ),
                                      ],
                                    ),
                              profile.getProfileModel != null &&
                                      profile.getProfileModel!.isKycDone == 1 &&
                                      profile.getProfileModel!.isFactaDone ==
                                          1 &&
                                      profile.getProfileModel!
                                              .isBseClientCreated ==
                                          1 &&
                                      profile.getProfileModel!.kycStatus ==
                                          "done"
                                  ? Container()
                                  : kycCard(data: profile.getProfileModel),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: SizeConfig.screenWidth,
                                alignment: Alignment.center,
                                height: 270,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xFFC4C4C4)),
                                child: Text(
                                  AppLocalizations.of(context)!.referearn,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              )),
        );
      },
    );
  }

  Container kycCard({GetProfileModel? data}) {
    return Container(
      width: SizeConfig.screenWidth,
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFF3D74E0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFC4C4C4)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.kycCheck,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline3?.color,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    data == null ? "" : data.kycStatus,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  )
                ],
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 18),
              height: 50,
              width: 4,
              color: Color(0xFFC4C4C4)),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFC4C4C4)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.personalDetails,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline3?.color,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    AppLocalizations.of(context)!.pending,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  )
                ],
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 18),
              height: 50,
              width: 4,
              color: Color(0xFFC4C4C4)),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFC4C4C4)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.bankDetails,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline3?.color,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    AppLocalizations.of(context)!.pending,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  onBoardJourney() {
    return Stack(
      children: [
        Container(
          height: SizeConfig.screenHeight * 0.2,
          width: SizeConfig.screenWidth * 0.9,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  appColorPrimary.withOpacity(0.5),
                  appColorPrimary2.withOpacity(0.5),
                ],
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.itdoesntcosttointroduceyourself,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headline3?.color,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PanCardFormScreen()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Color(0xff00124C),
                          borderRadius: BorderRadius.circular(75)),
                      child: Text(
                        AppLocalizations.of(context)!.clickhere,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(
            "assets/icons8-garden-58 1.png",
            scale: 2.5,
          ),
        )
      ],
    );
  }

  categoreyCard({String? textName, String? assetPath}) {
    return Container(
      width: 110,
      height: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              appColorPrimary.withOpacity(0.5),
              appColorPrimary2.withOpacity(0.5),
            ],
          ),
          color: Colors.white,
          boxShadow: [mainboxshadow]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  assetPath!,
                ),
              ),
            ),
          ),
          Text(
            textName!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headline3?.color,
                fontSize: SizeConfig.blockSizeHorizontal * 3.5),
          ),
        ],
      ),
    );
  }

  investmentValueCard() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: SizeConfig.screenHeight * 0.2,
        width: SizeConfig.screenWidth * 0.9,
        //padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              appColorPrimary.withOpacity(0.5),
              appColorPrimary2.withOpacity(0.5),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.currentValue,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline3?.color,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${rupeeSymbol} 5,00,000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.headline3?.color,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.investment,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline3?.color,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${rupeeSymbol} 3,00,000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.headline3?.color,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xirr',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline3?.color,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '20.41%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.headline3?.color,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.bottomCenter,
                    colors: [
                      appColorPrimary.withOpacity(0.5),
                      appColorPrimary2.withOpacity(0.5),
                    ],
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/pieChart.png',
                    scale: 3,
                  ),
                  Image.asset(
                    'assets/tablegraph.png',
                    scale: 3,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onGoingGoalsCard() {
    return Column(
      children: [],
    );
  }
}
