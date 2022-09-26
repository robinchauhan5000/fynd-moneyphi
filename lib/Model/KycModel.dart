import 'dart:io';

import 'package:equatable/equatable.dart';

enum Gender { Male, Female, Other }
enum MartialStatus { Single, Married }
enum BankType { Saving, Current }

class KycModel extends Equatable {
  String? panNumber;
  String? firstName;
  String? lastName;
  Gender? gender;
  DateTime? dateOfBirth;
  MartialStatus? martialStatus;
  String? fathersName;
  String? motherName;
  String? addressDetails;
  int? pinCode;
  String? city;
  String? country;
  String? occupationalDetails;
  String? incomeDetails;
  String? birthPlace;
  String? birthCountry;
  String? payTaxOutsideIndia;
  bool? politicallyExposed;
  bool? politicallyRelated;
  String? nomineeName;
  DateTime? nomineeDateOfBirth;
  String? ifscCode;
  File? proofUpload;
  String? bankName;
  String? branchName;
  String? accountNumber;
  BankType? bankType;

  KycModel(
      {this.panNumber,
      this.firstName,
      this.lastName,
      this.gender,
      this.dateOfBirth,
      this.martialStatus,
      this.fathersName,
      this.motherName,
      this.addressDetails,
      this.pinCode,
      this.city,
      this.country,
      this.occupationalDetails,
      this.incomeDetails,
      this.birthPlace,
      this.birthCountry,
      this.payTaxOutsideIndia,
      this.politicallyExposed,
      this.politicallyRelated,
      this.nomineeName,
      this.nomineeDateOfBirth,
      this.ifscCode,
      this.bankName,
      this.branchName,
      this.accountNumber,
      this.bankType,
      this.proofUpload});

  KycModel copyWith({
    final String? panNumber,
    final String? firstName,
    final String? lastName,
    final Gender? gender,
    final DateTime? dateOfBirth,
    final MartialStatus? martialStatus,
    final String? fathersName,
    final String? motherName,
    final String? addressDetails,
    final int? pinCode,
    final String? city,
    final String? country,
    final String? occupationalDetails,
    final String? incomeDetails,
    final String? birthPlace,
    final String? birthCountry,
    final String? payTaxOutsideIndia,
    final bool? politicallyExposed,
    final bool? politicallyRelated,
    final String? nomineeName,
    final DateTime? nomineeDateOfBirth,
    final String? ifscCode,
    final String? bankName,
    final String? branchName,
    final String? accountNumber,
    final BankType? bankType,
    final File? proofUpload,
  }) {
    return KycModel(
      panNumber: panNumber ?? this.panNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      martialStatus: martialStatus ?? this.martialStatus,
      fathersName: fathersName ?? this.fathersName,
      motherName: motherName ?? this.motherName,
      addressDetails: addressDetails ?? this.addressDetails,
      pinCode: pinCode ?? this.pinCode,
      city: city ?? this.city,
      country: country ?? this.country,
      occupationalDetails: occupationalDetails ?? this.occupationalDetails,
      incomeDetails: incomeDetails ?? this.incomeDetails,
      birthPlace: birthPlace ?? this.birthPlace,
      birthCountry: birthCountry ?? this.birthCountry,
      payTaxOutsideIndia: payTaxOutsideIndia ?? this.payTaxOutsideIndia,
      politicallyExposed: politicallyExposed ?? this.politicallyExposed,
      politicallyRelated: politicallyRelated ?? this.politicallyRelated,
      nomineeName: nomineeName ?? this.nomineeName,
      nomineeDateOfBirth: nomineeDateOfBirth ?? this.nomineeDateOfBirth,
      ifscCode: ifscCode ?? this.ifscCode,
      bankName: bankName ?? this.bankName,
      branchName: branchName ?? this.branchName,
      accountNumber: accountNumber ?? this.accountNumber,
      bankType: bankType ?? this.bankType,
      proofUpload: proofUpload ?? this.proofUpload,
    );
  }

  @override
  List<Object?> get props => [panNumber, firstName, lastName];
}
