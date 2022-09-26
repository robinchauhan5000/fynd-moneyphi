import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('gu'),
    Locale('hi')
  ];

  /// No description provided for @currentValue.
  ///
  /// In en, this message translates to:
  /// **'Current Value'**
  String get currentValue;

  /// No description provided for @investment.
  ///
  /// In en, this message translates to:
  /// **'Investment'**
  String get investment;

  /// No description provided for @createGoals.
  ///
  /// In en, this message translates to:
  /// **'Create Goals'**
  String get createGoals;

  /// No description provided for @bigDecisions.
  ///
  /// In en, this message translates to:
  /// **'Big Decisions'**
  String get bigDecisions;

  /// No description provided for @retirement.
  ///
  /// In en, this message translates to:
  /// **'Retirement'**
  String get retirement;

  /// No description provided for @insurance.
  ///
  /// In en, this message translates to:
  /// **'Insurance'**
  String get insurance;

  /// No description provided for @childFuture.
  ///
  /// In en, this message translates to:
  /// **'Child Future'**
  String get childFuture;

  /// No description provided for @housing.
  ///
  /// In en, this message translates to:
  /// **'Housing'**
  String get housing;

  /// No description provided for @smallDecisions.
  ///
  /// In en, this message translates to:
  /// **'Small Decisions'**
  String get smallDecisions;

  /// No description provided for @reserveFund.
  ///
  /// In en, this message translates to:
  /// **'Reserve Fund'**
  String get reserveFund;

  /// No description provided for @indulge.
  ///
  /// In en, this message translates to:
  /// **'Indulge'**
  String get indulge;

  /// No description provided for @car.
  ///
  /// In en, this message translates to:
  /// **'Car'**
  String get car;

  /// No description provided for @holiday.
  ///
  /// In en, this message translates to:
  /// **'Holiday'**
  String get holiday;

  /// No description provided for @newBeginnings.
  ///
  /// In en, this message translates to:
  /// **'New Beginnings'**
  String get newBeginnings;

  /// No description provided for @openDemat.
  ///
  /// In en, this message translates to:
  /// **'Open Demat'**
  String get openDemat;

  /// No description provided for @saveTax.
  ///
  /// In en, this message translates to:
  /// **'SaveTax'**
  String get saveTax;

  /// No description provided for @learnwithphi.
  ///
  /// In en, this message translates to:
  /// **'Learn with phi'**
  String get learnwithphi;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @pocket.
  ///
  /// In en, this message translates to:
  /// **'Pocket'**
  String get pocket;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @stories.
  ///
  /// In en, this message translates to:
  /// **'Stories'**
  String get stories;

  /// No description provided for @rewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get rewards;

  /// No description provided for @onboardyourjourney.
  ///
  /// In en, this message translates to:
  /// **'On board your journey'**
  String get onboardyourjourney;

  /// No description provided for @itdoesntcosttointroduceyourself.
  ///
  /// In en, this message translates to:
  /// **'It doesnt cost to introduce yourself'**
  String get itdoesntcosttointroduceyourself;

  /// No description provided for @clickhere.
  ///
  /// In en, this message translates to:
  /// **'click here'**
  String get clickhere;

  /// No description provided for @letyourmoneyworkforyou.
  ///
  /// In en, this message translates to:
  /// **'Let your money work for you'**
  String get letyourmoneyworkforyou;

  /// No description provided for @startaSIP.
  ///
  /// In en, this message translates to:
  /// **'Start a SIP'**
  String get startaSIP;

  /// No description provided for @iamabeginner.
  ///
  /// In en, this message translates to:
  /// **'I am a\nbeginner'**
  String get iamabeginner;

  /// No description provided for @investinDigitalGold.
  ///
  /// In en, this message translates to:
  /// **'Invest in Digital Gold'**
  String get investinDigitalGold;

  /// No description provided for @setupyouraccount.
  ///
  /// In en, this message translates to:
  /// **'Setup your account'**
  String get setupyouraccount;

  /// No description provided for @kycCheck.
  ///
  /// In en, this message translates to:
  /// **'Kyc Check'**
  String get kycCheck;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @personalDetails.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personalDetails;

  /// No description provided for @bankDetails.
  ///
  /// In en, this message translates to:
  /// **'Bank Details'**
  String get bankDetails;

  /// No description provided for @referearn.
  ///
  /// In en, this message translates to:
  /// **'refer & earn'**
  String get referearn;

  /// No description provided for @letsbegun.
  ///
  /// In en, this message translates to:
  /// **'Lets begun'**
  String get letsbegun;

  /// No description provided for @weneedyourpantoprocessfurther.
  ///
  /// In en, this message translates to:
  /// **'We need your pan to process further '**
  String get weneedyourpantoprocessfurther;

  /// No description provided for @pAN.
  ///
  /// In en, this message translates to:
  /// **'PAN'**
  String get pAN;

  /// No description provided for @kYCVerified.
  ///
  /// In en, this message translates to:
  /// **'KYC Verified'**
  String get kYCVerified;

  /// No description provided for @nameasperpan.
  ///
  /// In en, this message translates to:
  /// **'Name as per pan'**
  String get nameasperpan;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @confirmContinue.
  ///
  /// In en, this message translates to:
  /// **'Confirm Continue'**
  String get confirmContinue;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @enterhere.
  ///
  /// In en, this message translates to:
  /// **'Enter here'**
  String get enterhere;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get others;

  /// No description provided for @dateofBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateofBirth;

  /// No description provided for @maritalStatus.
  ///
  /// In en, this message translates to:
  /// **'Martial Status'**
  String get maritalStatus;

  /// No description provided for @single.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get single;

  /// No description provided for @married.
  ///
  /// In en, this message translates to:
  /// **'Married'**
  String get married;

  /// No description provided for @familyDetails.
  ///
  /// In en, this message translates to:
  /// **'Family Details'**
  String get familyDetails;

  /// No description provided for @fathersName.
  ///
  /// In en, this message translates to:
  /// **'Fathers Name'**
  String get fathersName;

  /// No description provided for @mothersName.
  ///
  /// In en, this message translates to:
  /// **'Mothers Name'**
  String get mothersName;

  /// No description provided for @addressDetails.
  ///
  /// In en, this message translates to:
  /// **'Address Details'**
  String get addressDetails;

  /// No description provided for @pincode.
  ///
  /// In en, this message translates to:
  /// **'Pin Code'**
  String get pincode;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @professionalDetails.
  ///
  /// In en, this message translates to:
  /// **'Professional Details'**
  String get professionalDetails;

  /// No description provided for @occupationDetails.
  ///
  /// In en, this message translates to:
  /// **'Occupational Details'**
  String get occupationDetails;

  /// No description provided for @incomeDetails.
  ///
  /// In en, this message translates to:
  /// **'Income Details'**
  String get incomeDetails;

  /// No description provided for @birthPlace.
  ///
  /// In en, this message translates to:
  /// **'Birth Place'**
  String get birthPlace;

  /// No description provided for @birthCountry.
  ///
  /// In en, this message translates to:
  /// **'Birth Country'**
  String get birthCountry;

  /// No description provided for @doyoupaytaxesoutsideIndia.
  ///
  /// In en, this message translates to:
  /// **'Do you pay taxes outside India'**
  String get doyoupaytaxesoutsideIndia;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @countryyoupaytaxoutsideIndia.
  ///
  /// In en, this message translates to:
  /// **'Country you pay tax outside India'**
  String get countryyoupaytaxoutsideIndia;

  /// No description provided for @areyouPoliticallyexposedorrelated.
  ///
  /// In en, this message translates to:
  /// **'Are you Politically exposed or related'**
  String get areyouPoliticallyexposedorrelated;

  /// No description provided for @taxIdentificationNumber.
  ///
  /// In en, this message translates to:
  /// **'Tax Identification Number'**
  String get taxIdentificationNumber;

  /// No description provided for @iampoliticallyexposed.
  ///
  /// In en, this message translates to:
  /// **'I am politically exposed'**
  String get iampoliticallyexposed;

  /// No description provided for @iampoliticallyrelated.
  ///
  /// In en, this message translates to:
  /// **'Iam politically related'**
  String get iampoliticallyrelated;

  /// No description provided for @nomineeDetails.
  ///
  /// In en, this message translates to:
  /// **'Nominee Details'**
  String get nomineeDetails;

  /// No description provided for @nomineeName.
  ///
  /// In en, this message translates to:
  /// **'Nominee Name'**
  String get nomineeName;

  /// No description provided for @relation.
  ///
  /// In en, this message translates to:
  /// **'Relation'**
  String get relation;

  /// No description provided for @iFSCCode.
  ///
  /// In en, this message translates to:
  /// **'IFSC Code'**
  String get iFSCCode;

  /// No description provided for @bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankName;

  /// No description provided for @branch.
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get branch;

  /// No description provided for @accountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get accountNumber;

  /// No description provided for @reenterAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Re enter Account Number'**
  String get reenterAccountNumber;

  /// No description provided for @selectaccounttype.
  ///
  /// In en, this message translates to:
  /// **'Select account type'**
  String get selectaccounttype;

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get current;

  /// No description provided for @uploadBankProof.
  ///
  /// In en, this message translates to:
  /// **'Upload Bank Proof'**
  String get uploadBankProof;

  /// No description provided for @selectthedocumentyouwillupload.
  ///
  /// In en, this message translates to:
  /// **'Select the document you will upload'**
  String get selectthedocumentyouwillupload;

  /// No description provided for @cancelCheque.
  ///
  /// In en, this message translates to:
  /// **'Cancel Cheque'**
  String get cancelCheque;

  /// No description provided for @bankStatement.
  ///
  /// In en, this message translates to:
  /// **'Bank Statement'**
  String get bankStatement;

  /// No description provided for @ourteamwillverifyyourbank.
  ///
  /// In en, this message translates to:
  /// **'Our team will verify your bank.Please uplaod or capture a clear image with all details like Your name, IFSC Code, Bank Account number and bank details.'**
  String get ourteamwillverifyyourbank;

  /// No description provided for @chqorbankstatementproof.
  ///
  /// In en, this message translates to:
  /// **'Chq or bank statement proof'**
  String get chqorbankstatementproof;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @uploadSignature.
  ///
  /// In en, this message translates to:
  /// **'Upload Signature'**
  String get uploadSignature;

  /// No description provided for @signinthespaceprovided.
  ///
  /// In en, this message translates to:
  /// **'Sign in the space provided.'**
  String get signinthespaceprovided;

  /// No description provided for @confirmProceed.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Proceed'**
  String get confirmProceed;

  /// No description provided for @iagreethatIamaIndiancitizenresidinginIndia.
  ///
  /// In en, this message translates to:
  /// **'I agree that Iam a Indian citizen residing in India. I confirm the bank detail & document uploaded are mine. All transactions & redemption will be in this bank account. In case of any discripancy in my form, I will submit relevant documents as required.'**
  String get iagreethatIamaIndiancitizenresidinginIndia;

  /// No description provided for @returns.
  ///
  /// In en, this message translates to:
  /// **'Returns'**
  String get returns;

  /// No description provided for @assetAllocation.
  ///
  /// In en, this message translates to:
  /// **'Asset Allocation'**
  String get assetAllocation;

  /// No description provided for @portFolio.
  ///
  /// In en, this message translates to:
  /// **'Port Folio'**
  String get portFolio;

  /// No description provided for @ongoingGoals.
  ///
  /// In en, this message translates to:
  /// **'Ongoing Goals'**
  String get ongoingGoals;

  /// No description provided for @mutualFunds.
  ///
  /// In en, this message translates to:
  /// **'Mutual Funds'**
  String get mutualFunds;

  /// No description provided for @equity.
  ///
  /// In en, this message translates to:
  /// **'Equity'**
  String get equity;

  /// No description provided for @hybrid.
  ///
  /// In en, this message translates to:
  /// **'Hybrid'**
  String get hybrid;

  /// No description provided for @debt.
  ///
  /// In en, this message translates to:
  /// **'Debt'**
  String get debt;

  /// No description provided for @commodities.
  ///
  /// In en, this message translates to:
  /// **'Commodities'**
  String get commodities;

  /// No description provided for @largeCap.
  ///
  /// In en, this message translates to:
  /// **'Large Cap'**
  String get largeCap;

  /// No description provided for @midCap.
  ///
  /// In en, this message translates to:
  /// **'Mid Cap'**
  String get midCap;

  /// No description provided for @smallCap.
  ///
  /// In en, this message translates to:
  /// **'Small Cap'**
  String get smallCap;

  /// No description provided for @indexFund.
  ///
  /// In en, this message translates to:
  /// **'Index Fund'**
  String get indexFund;

  /// No description provided for @globalFund.
  ///
  /// In en, this message translates to:
  /// **'Global Fund'**
  String get globalFund;

  /// No description provided for @viewMore.
  ///
  /// In en, this message translates to:
  /// **'View More'**
  String get viewMore;

  /// No description provided for @bestSIPFunds.
  ///
  /// In en, this message translates to:
  /// **'Best SIP Funds'**
  String get bestSIPFunds;

  /// No description provided for @basedonlast5yearsreturn.
  ///
  /// In en, this message translates to:
  /// **'Based on last 5 years return'**
  String get basedonlast5yearsreturn;

  /// No description provided for @startSIPwith.
  ///
  /// In en, this message translates to:
  /// **'Start SIP with\n ₹100'**
  String get startSIPwith;

  /// No description provided for @betterthanFD.
  ///
  /// In en, this message translates to:
  /// **'Better than FD'**
  String get betterthanFD;

  /// No description provided for @taxsavingfunds.
  ///
  /// In en, this message translates to:
  /// **'Tax saving funds'**
  String get taxsavingfunds;

  /// No description provided for @investmentsachet.
  ///
  /// In en, this message translates to:
  /// **'Investment sachet'**
  String get investmentsachet;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving'**
  String get saving;

  /// No description provided for @growth.
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get growth;

  /// No description provided for @vision.
  ///
  /// In en, this message translates to:
  /// **'Vision'**
  String get vision;

  /// No description provided for @nAV.
  ///
  /// In en, this message translates to:
  /// **'NAV'**
  String get nAV;

  /// No description provided for @minSIP.
  ///
  /// In en, this message translates to:
  /// **'Min SIP'**
  String get minSIP;

  /// No description provided for @investnow.
  ///
  /// In en, this message translates to:
  /// **'Invest Now'**
  String get investnow;

  /// No description provided for @filterOption.
  ///
  /// In en, this message translates to:
  /// **'Filter Option'**
  String get filterOption;

  /// No description provided for @minimumSIPInvestment.
  ///
  /// In en, this message translates to:
  /// **'Minimum SIP Investment'**
  String get minimumSIPInvestment;

  /// No description provided for @investmentOption.
  ///
  /// In en, this message translates to:
  /// **'Investment Option'**
  String get investmentOption;

  /// No description provided for @mutualFundCompanies.
  ///
  /// In en, this message translates to:
  /// **'Mutual Fund Companies'**
  String get mutualFundCompanies;

  /// No description provided for @investmentAmount.
  ///
  /// In en, this message translates to:
  /// **'Investment Amount'**
  String get investmentAmount;

  /// No description provided for @minimumInvestment.
  ///
  /// In en, this message translates to:
  /// **'minimum investment'**
  String get minimumInvestment;

  /// No description provided for @installments.
  ///
  /// In en, this message translates to:
  /// **'Installments'**
  String get installments;

  /// No description provided for @untillCancelled.
  ///
  /// In en, this message translates to:
  /// **'Untill Cancelled'**
  String get untillCancelled;

  /// No description provided for @recommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @addtocart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get addtocart;

  /// No description provided for @proceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get proceed;

  /// No description provided for @fundsaddedtocart.
  ///
  /// In en, this message translates to:
  /// **'Funds added to cart'**
  String get fundsaddedtocart;

  /// No description provided for @continuetoinvestinmorefundsorelseproceed.
  ///
  /// In en, this message translates to:
  /// **'Continue to invest in more funds or else proceed'**
  String get continuetoinvestinmorefundsorelseproceed;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @allocation.
  ///
  /// In en, this message translates to:
  /// **'Allocation'**
  String get allocation;

  /// No description provided for @selectSIPInvestment.
  ///
  /// In en, this message translates to:
  /// **'Select SIP Investment'**
  String get selectSIPInvestment;

  /// No description provided for @poweredby.
  ///
  /// In en, this message translates to:
  /// **'powered by'**
  String get poweredby;

  /// No description provided for @purity.
  ///
  /// In en, this message translates to:
  /// **'24K99.9 purity'**
  String get purity;

  /// No description provided for @purchasegoldforaslowas.
  ///
  /// In en, this message translates to:
  /// **'Purchase gold for as low as'**
  String get purchasegoldforaslowas;

  /// No description provided for @securedinsuredinLocker.
  ///
  /// In en, this message translates to:
  /// **'Secured & insured in Locker'**
  String get securedinsuredinLocker;

  /// No description provided for @convertyourgoldgramsingoldcoins.
  ///
  /// In en, this message translates to:
  /// **'Convert your gold grams in gold coins'**
  String get convertyourgoldgramsingoldcoins;

  /// No description provided for @buyinrupees.
  ///
  /// In en, this message translates to:
  /// **'Buy in rupees'**
  String get buyinrupees;

  /// No description provided for @buyingrams.
  ///
  /// In en, this message translates to:
  /// **'Buy in grams'**
  String get buyingrams;

  /// No description provided for @gms.
  ///
  /// In en, this message translates to:
  /// **'Gms'**
  String get gms;

  /// No description provided for @livebuyprice.
  ///
  /// In en, this message translates to:
  /// **'Live buy price'**
  String get livebuyprice;

  /// No description provided for @pricevalidfor.
  ///
  /// In en, this message translates to:
  /// **'Price valid for'**
  String get pricevalidfor;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @locker.
  ///
  /// In en, this message translates to:
  /// **'Locker'**
  String get locker;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'cart'**
  String get cart;

  /// No description provided for @sIPAmount.
  ///
  /// In en, this message translates to:
  /// **'SIP Amount'**
  String get sIPAmount;

  /// No description provided for @selectSIPdate.
  ///
  /// In en, this message translates to:
  /// **'Select sip date'**
  String get selectSIPdate;

  /// No description provided for @sIPon.
  ///
  /// In en, this message translates to:
  /// **'SIP on'**
  String get sIPon;

  /// No description provided for @foliono.
  ///
  /// In en, this message translates to:
  /// **'folio no'**
  String get foliono;

  /// No description provided for @seefunds.
  ///
  /// In en, this message translates to:
  /// **'see funds'**
  String get seefunds;

  /// No description provided for @growthSachet.
  ///
  /// In en, this message translates to:
  /// **'growth sachet'**
  String get growthSachet;

  /// No description provided for @placeorder.
  ///
  /// In en, this message translates to:
  /// **'place order'**
  String get placeorder;

  /// No description provided for @calenderselecttrayfrombottom.
  ///
  /// In en, this message translates to:
  /// **'Calender select tray from bottom'**
  String get calenderselecttrayfrombottom;

  /// No description provided for @setupyourAutopay.
  ///
  /// In en, this message translates to:
  /// **'set up your auto pay'**
  String get setupyourAutopay;

  /// No description provided for @clickpaywillautomateyourinvestmentsfromyourregisteredbankaccount.
  ///
  /// In en, this message translates to:
  /// **'Click pay will automate your investments from your registered bank account'**
  String get clickpaywillautomateyourinvestmentsfromyourregisteredbankaccount;

  /// No description provided for @yourbankdetails.
  ///
  /// In en, this message translates to:
  /// **'your bank details'**
  String get yourbankdetails;

  /// No description provided for @maximumautodebitlimit.
  ///
  /// In en, this message translates to:
  /// **'maximum auto debit limit'**
  String get maximumautodebitlimit;

  /// No description provided for @donthaveaccesstoonlinebanking.
  ///
  /// In en, this message translates to:
  /// **'Dont have access to online banking'**
  String get donthaveaccesstoonlinebanking;

  /// No description provided for @toCreateofflineautopay.
  ///
  /// In en, this message translates to:
  /// **'To create offline autopay'**
  String get toCreateofflineautopay;

  /// No description provided for @createAutopay.
  ///
  /// In en, this message translates to:
  /// **'create autopay'**
  String get createAutopay;

  /// No description provided for @automatefutureSIPinstallments.
  ///
  /// In en, this message translates to:
  /// **'Automate future SIP installments'**
  String get automatefutureSIPinstallments;

  /// No description provided for @singleclickbuttonforfutureinvestment.
  ///
  /// In en, this message translates to:
  /// **'single click button for future investment'**
  String get singleclickbuttonforfutureinvestment;

  /// No description provided for @noinvestmentswithoutyourapproval.
  ///
  /// In en, this message translates to:
  /// **'no investment without your approval'**
  String get noinvestmentswithoutyourapproval;

  /// No description provided for @exampleYoudecidetoinvest.
  ///
  /// In en, this message translates to:
  /// **'Example you decide to invest'**
  String get exampleYoudecidetoinvest;

  /// No description provided for @yousetautodebitlimitas.
  ///
  /// In en, this message translates to:
  /// **'your set auto debit limit as'**
  String get yousetautodebitlimitas;

  /// No description provided for @nowinfutureifyouwanttoincreaseyourSIP.
  ///
  /// In en, this message translates to:
  /// **'Now in future if you want to increase your SIP.No new mandate has to be created or no new process of mandate approval has to be done if your SIP amount is upto your approved mandate limit.'**
  String get nowinfutureifyouwanttoincreaseyourSIP;

  /// No description provided for @mandateidcreatedsuccessfully.
  ///
  /// In en, this message translates to:
  /// **'mandate id created successfully'**
  String get mandateidcreatedsuccessfully;

  /// No description provided for @yourbanksupportselectronicautopay.
  ///
  /// In en, this message translates to:
  /// **'Your bank supports electronic autopay'**
  String get yourbanksupportselectronicautopay;

  /// No description provided for @youareallsettostartyourinvestingtoday.
  ///
  /// In en, this message translates to:
  /// **'You are all set to start your investing today.'**
  String get youareallsettostartyourinvestingtoday;

  /// No description provided for @yourmandateissafesecured.
  ///
  /// In en, this message translates to:
  /// **'your mandate is safe secured'**
  String get yourmandateissafesecured;

  /// No description provided for @totalpayable.
  ///
  /// In en, this message translates to:
  /// **'total payable'**
  String get totalpayable;

  /// No description provided for @yourBankAccount.
  ///
  /// In en, this message translates to:
  /// **'your Bank Account'**
  String get yourBankAccount;

  /// No description provided for @paymentModes.
  ///
  /// In en, this message translates to:
  /// **'payment Modes'**
  String get paymentModes;

  /// No description provided for @netBanking.
  ///
  /// In en, this message translates to:
  /// **'Net Banking'**
  String get netBanking;

  /// No description provided for @mandate.
  ///
  /// In en, this message translates to:
  /// **'Mandate'**
  String get mandate;

  /// No description provided for @entertheUPIID.
  ///
  /// In en, this message translates to:
  /// **'Enter the UPI ID'**
  String get entertheUPIID;

  /// No description provided for @paynow.
  ///
  /// In en, this message translates to:
  /// **'Pay now'**
  String get paynow;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @orderStatus.
  ///
  /// In en, this message translates to:
  /// **'Order Status'**
  String get orderStatus;

  /// No description provided for @redeem.
  ///
  /// In en, this message translates to:
  /// **'Redeem'**
  String get redeem;

  /// No description provided for @inProcess.
  ///
  /// In en, this message translates to:
  /// **'In Process'**
  String get inProcess;

  /// No description provided for @holidayGoa.
  ///
  /// In en, this message translates to:
  /// **'Holiday Goa'**
  String get holidayGoa;

  /// No description provided for @onetime.
  ///
  /// In en, this message translates to:
  /// **'એક વાર'**
  String get onetime;

  /// No description provided for @orderplacedonmoneyphiBSE.
  ///
  /// In en, this message translates to:
  /// **'Order placed on moneyphi BSE'**
  String get orderplacedonmoneyphiBSE;

  /// No description provided for @orderID.
  ///
  /// In en, this message translates to:
  /// **'Order ID'**
  String get orderID;

  /// No description provided for @paymentReceivedviaUPI.
  ///
  /// In en, this message translates to:
  /// **'payment Received via UPI'**
  String get paymentReceivedviaUPI;

  /// No description provided for @debitfromxxxx1234AxisBank.
  ///
  /// In en, this message translates to:
  /// **'Debit from xxxx1234 Axis Bank'**
  String get debitfromxxxx1234AxisBank;

  /// No description provided for @unitsAllocation.
  ///
  /// In en, this message translates to:
  /// **'Units Allocation'**
  String get unitsAllocation;

  /// No description provided for @expectedby.
  ///
  /// In en, this message translates to:
  /// **'expected by'**
  String get expectedby;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @noGoal.
  ///
  /// In en, this message translates to:
  /// **'No Goal'**
  String get noGoal;

  /// No description provided for @paymentReceived.
  ///
  /// In en, this message translates to:
  /// **'Payment Received'**
  String get paymentReceived;

  /// No description provided for @unitsAlloted.
  ///
  /// In en, this message translates to:
  /// **'Units Alloted'**
  String get unitsAlloted;

  /// No description provided for @allotedon.
  ///
  /// In en, this message translates to:
  /// **'Alloted on'**
  String get allotedon;

  /// No description provided for @units.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get units;

  /// No description provided for @orderplacedonmoneyphi.
  ///
  /// In en, this message translates to:
  /// **'Order placed on moneyphi'**
  String get orderplacedonmoneyphi;

  /// No description provided for @sIPRegistered.
  ///
  /// In en, this message translates to:
  /// **'SIP Registered'**
  String get sIPRegistered;

  /// No description provided for @autopay.
  ///
  /// In en, this message translates to:
  /// **'Autopay'**
  String get autopay;

  /// No description provided for @sIPDate.
  ///
  /// In en, this message translates to:
  /// **'SIP Date'**
  String get sIPDate;

  /// No description provided for @nextduedateon.
  ///
  /// In en, this message translates to:
  /// **'Next due date on'**
  String get nextduedateon;

  /// No description provided for @redemptionRequested.
  ///
  /// In en, this message translates to:
  /// **'Redemption Requested'**
  String get redemptionRequested;

  /// No description provided for @amountCredited.
  ///
  /// In en, this message translates to:
  /// **'Amount Credited'**
  String get amountCredited;

  /// No description provided for @withdarwal.
  ///
  /// In en, this message translates to:
  /// **'Withdarwal'**
  String get withdarwal;

  /// No description provided for @goals.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get goals;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @insights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get insights;

  /// No description provided for @invested.
  ///
  /// In en, this message translates to:
  /// **'Invested'**
  String get invested;

  /// No description provided for @returnText.
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get returnText;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @investMore.
  ///
  /// In en, this message translates to:
  /// **'Invest More'**
  String get investMore;

  /// No description provided for @fundDetails.
  ///
  /// In en, this message translates to:
  /// **'Fund Details'**
  String get fundDetails;

  /// No description provided for @statement.
  ///
  /// In en, this message translates to:
  /// **'Statement'**
  String get statement;

  /// No description provided for @avgBuyingNav.
  ///
  /// In en, this message translates to:
  /// **'Avg Buying Nav'**
  String get avgBuyingNav;

  /// No description provided for @currentNAV.
  ///
  /// In en, this message translates to:
  /// **'Current NAV'**
  String get currentNAV;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @recentTranscations.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get recentTranscations;

  /// No description provided for @installmentmissed.
  ///
  /// In en, this message translates to:
  /// **'Installment missed'**
  String get installmentmissed;

  /// No description provided for @firstInstallmentPaid.
  ///
  /// In en, this message translates to:
  /// **'First installment paid'**
  String get firstInstallmentPaid;

  /// No description provided for @nextduedate.
  ///
  /// In en, this message translates to:
  /// **'NExt due date'**
  String get nextduedate;

  /// No description provided for @invest.
  ///
  /// In en, this message translates to:
  /// **'Invest'**
  String get invest;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @stopSIP.
  ///
  /// In en, this message translates to:
  /// **'Stop SIP'**
  String get stopSIP;

  /// No description provided for @additional.
  ///
  /// In en, this message translates to:
  /// **'Additional'**
  String get additional;

  /// No description provided for @redemption.
  ///
  /// In en, this message translates to:
  /// **'Redemption'**
  String get redemption;

  /// No description provided for @full.
  ///
  /// In en, this message translates to:
  /// **'Full'**
  String get full;

  /// No description provided for @partial.
  ///
  /// In en, this message translates to:
  /// **'Partial'**
  String get partial;

  /// No description provided for @withdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get withdraw;

  /// No description provided for @goldGrams.
  ///
  /// In en, this message translates to:
  /// **'Gold Grams'**
  String get goldGrams;

  /// No description provided for @digitalGold.
  ///
  /// In en, this message translates to:
  /// **'Digital Gold'**
  String get digitalGold;

  /// No description provided for @areyousureyouwanttocancelyourSIP.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel your SIP'**
  String get areyousureyouwanttocancelyourSIP;

  /// No description provided for @havequestionsAskus.
  ///
  /// In en, this message translates to:
  /// **'Have questions Ask us'**
  String get havequestionsAskus;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @youwillmissyourgoaltargetforthefollowinggoals.
  ///
  /// In en, this message translates to:
  /// **'You will miss your goal target for the following goals.'**
  String get youwillmissyourgoaltargetforthefollowinggoals;

  /// No description provided for @sIPPause.
  ///
  /// In en, this message translates to:
  /// **'SIP Pause'**
  String get sIPPause;

  /// No description provided for @cancelSIP.
  ///
  /// In en, this message translates to:
  /// **'Cancel SIP'**
  String get cancelSIP;

  /// No description provided for @aunthenciatetocancelyourSIP.
  ///
  /// In en, this message translates to:
  /// **'Aunthenciate to cancel your SIP'**
  String get aunthenciatetocancelyourSIP;

  /// No description provided for @oTP.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get oTP;

  /// No description provided for @didnotreceiveOTP.
  ///
  /// In en, this message translates to:
  /// **'Did not receive OTP?'**
  String get didnotreceiveOTP;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @fullRedemption.
  ///
  /// In en, this message translates to:
  /// **'Full Redemption'**
  String get fullRedemption;

  /// No description provided for @exitLoad.
  ///
  /// In en, this message translates to:
  /// **'exit load'**
  String get exitLoad;

  /// No description provided for @ifredeemedbefore365days.
  ///
  /// In en, this message translates to:
  /// **'if redeemed before365 days.'**
  String get ifredeemedbefore365days;

  /// No description provided for @ifredeemedbefore720days.
  ///
  /// In en, this message translates to:
  /// **'if redeemed before 720 days'**
  String get ifredeemedbefore720days;

  /// No description provided for @pleasedonotrefreshortaponbackbutton.
  ///
  /// In en, this message translates to:
  /// **'Please donot refresh or tap On back button'**
  String get pleasedonotrefreshortaponbackbutton;

  /// No description provided for @mutualfundDetails.
  ///
  /// In en, this message translates to:
  /// **'Mutual fund Details'**
  String get mutualfundDetails;

  /// No description provided for @riskVeryHighRisk.
  ///
  /// In en, this message translates to:
  /// **'Risk Very High Risk'**
  String get riskVeryHighRisk;

  /// No description provided for @dayChange.
  ///
  /// In en, this message translates to:
  /// **'Day Change'**
  String get dayChange;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer: The above graph is a comparison against different investment products which may offer fix & guaranteed returns like saving account or fixed deposit. Mutual fund returns are not guaranteed and are subject to market risk. Read all scheme related documents carefully before investing. Past performance is not a guarantee of future returns'**
  String get disclaimer;

  /// No description provided for @savingaccount.
  ///
  /// In en, this message translates to:
  /// **'saving account'**
  String get savingaccount;

  /// No description provided for @fixedDeposit.
  ///
  /// In en, this message translates to:
  /// **'fixed deposit'**
  String get fixedDeposit;

  /// No description provided for @thisFund.
  ///
  /// In en, this message translates to:
  /// **'this fund'**
  String get thisFund;

  /// No description provided for @fundPerformance.
  ///
  /// In en, this message translates to:
  /// **'fund performance'**
  String get fundPerformance;

  /// No description provided for @sIPReturns.
  ///
  /// In en, this message translates to:
  /// **'SIP returns'**
  String get sIPReturns;

  /// No description provided for @onetimereturns.
  ///
  /// In en, this message translates to:
  /// **'one time returns'**
  String get onetimereturns;

  /// No description provided for @schemeDetails.
  ///
  /// In en, this message translates to:
  /// **'scheme details'**
  String get schemeDetails;

  /// No description provided for @aMCInformation.
  ///
  /// In en, this message translates to:
  /// **'AMC information'**
  String get aMCInformation;

  /// No description provided for @fundSize.
  ///
  /// In en, this message translates to:
  /// **'fund size'**
  String get fundSize;

  /// No description provided for @benchmark.
  ///
  /// In en, this message translates to:
  /// **'benchmark'**
  String get benchmark;

  /// No description provided for @expenseRatio.
  ///
  /// In en, this message translates to:
  /// **'expense ratio'**
  String get expenseRatio;

  /// No description provided for @fundLaunch.
  ///
  /// In en, this message translates to:
  /// **'fund launch'**
  String get fundLaunch;

  /// No description provided for @lockin.
  ///
  /// In en, this message translates to:
  /// **'lock in'**
  String get lockin;

  /// No description provided for @schemeDocuments.
  ///
  /// In en, this message translates to:
  /// **'scheme documents'**
  String get schemeDocuments;

  /// No description provided for @lumpsum.
  ///
  /// In en, this message translates to:
  /// **'lumpsum'**
  String get lumpsum;

  /// No description provided for @comparisonwithotherLargecapfunds.
  ///
  /// In en, this message translates to:
  /// **'Comparison with other Largecap funds'**
  String get comparisonwithotherLargecapfunds;

  /// No description provided for @totalAUM.
  ///
  /// In en, this message translates to:
  /// **'Total AUM'**
  String get totalAUM;

  /// No description provided for @noofSchemes.
  ///
  /// In en, this message translates to:
  /// **'No of Schemes'**
  String get noofSchemes;

  /// No description provided for @seeall.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeall;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'gu', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'gu': return AppLocalizationsGu();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
