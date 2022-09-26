import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneyphi/Model/KycFormModel/PartTwoOneModel.dart';
import 'package:moneyphi/Model/KycModel.dart';
import 'package:moneyphi/controller/BankDetailsController.dart';
import 'package:moneyphi/controller/BscCodeRepo.dart';
import 'package:moneyphi/controller/LoginController.dart';
import 'package:moneyphi/controller/PanVerificationRepo.dart';
import 'package:moneyphi/controller/PortfolioController.dart';
import 'package:moneyphi/controller/check_out_controller.dart';
import 'package:moneyphi/controller/dashBoardController.dart';
import 'package:moneyphi/screens/kycFoms/bsc_code_bloc/bsc_code_bloc.dart';
import 'package:moneyphi/screens/kycFoms/kyc_bloc/part_two_one/part_two_one_cubit.dart';
import 'package:moneyphi/screens/kycFoms/kyc_bloc/part_two_three/part_two_three_cubit.dart';
import 'package:moneyphi/screens/kycFoms/kyc_bloc/part_two_two/part_two_two_cubit.dart';
import 'package:moneyphi/screens/kycFoms/kyc_bloc/partfive/part_five_cubit.dart';
import 'package:moneyphi/screens/kycFoms/pan_verify_cubit/pan_kycverification_cubit.dart';
import 'package:moneyphi/theme/bloc/theme_cubit.dart';
import 'package:provider/provider.dart';

import 'Model/KycFormModel/PartTwoTwoModel.dart';
import 'controller/ImagePickerController.dart';
import 'controller/LocaleProvider.dart';
import 'controller/MutualFundsController.dart';
import 'controller/PaymentController.dart';
import 'controller/signUpController.dart';
import 'screens/NavigatonBar/BottomNavigation.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => KycModel(),
        ),
        RepositoryProvider(
          create: (context) => PartTwoOneModel(),
        ),
        RepositoryProvider(
          create: (context) => PartTwoTwoModel(),
        ),
        RepositoryProvider(
          create: (context) => PanVerificationRepo(),
        ),
        RepositoryProvider(
          create: (context) => BscCodeRepo(),
        ),
        // RepositoryProvider(
        //   create: (context) => SignUpRepo(),
        // ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(
            create: (context) => PanKycverificationCubit(
                panVerificationRepo:
                    RepositoryProvider.of<PanVerificationRepo>(context)),
          ),
          BlocProvider(
            create: (context) => PartTwoOneCubit(
                panVerificationRepo:
                    RepositoryProvider.of<PanVerificationRepo>(context)),
          ),
          BlocProvider(
            create: (context) => PartTwoTwoCubit(
                panVerificationRepo:
                    RepositoryProvider.of<PanVerificationRepo>(context)),
          ),
          BlocProvider(
            create: (context) => BscCodeBloc(
                bscCodeRepo: RepositoryProvider.of<BscCodeRepo>(context)),
          ),
          BlocProvider(
            create: (context) => PartTwoThreeCubit(
                panVerificationRepo:
                    RepositoryProvider.of<PanVerificationRepo>(context)),
          ),
          BlocProvider(
            create: (context) => PartFiveCubit(
                panVerificationRepo:
                    RepositoryProvider.of<PanVerificationRepo>(context)),
          )
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SignUpController()),
            ChangeNotifierProvider(create: (_) => AppLocale()),
            ChangeNotifierProvider(create: (_) => DashBoardController()),
            ChangeNotifierProvider(create: (_) => ImagePickerController()),
            ChangeNotifierProvider(create: (_) => KYCController()),
            ChangeNotifierProvider(create: (_) => LoginController()),
            ChangeNotifierProvider(create: (_) => MutualFundsController()),
            ChangeNotifierProvider(create: (_) => GetBankDetailsController()),
            ChangeNotifierProvider(create: (_) => PaymentController()),
            ChangeNotifierProvider(create: (_) => PortfolioController()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return Consumer<AppLocale>(builder: (context, locale, child) {
                return MaterialApp(
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    locale: locale.locale,
                    debugShowCheckedModeBanner: false,
                    title: 'Money Phi',
                    theme: context.watch<ThemeCubit>().state.theme,
                    home: BottomNavBarV2()
                    // SplashScreen(),
                    );
              });
            },
          ),
        ),
      ),
    );
  }
}
