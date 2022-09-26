// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    required this.id,
    required this.insId,
    required this.fName,
    required this.mName,
    required this.lName,
    required this.panName,
    required this.email,
    required this.emailVerified,
    required this.gender,
    required this.phoneCode,
    required this.phoneNumber,
    required this.phoneVerified,
    required this.riskProfileSetDate,
    required this.dob,
    required this.pan,
    required this.bseClientCode,
    required this.accType1,
    required this.accNo1,
    required this.bankName1,
    required this.micrNo1,
    required this.ifscCode1,
    required this.bankBranch1,
    required this.defaultbank1,
    required this.taxRes1,
    required this.tpin1,
    required this.riskType,
    required this.riskScore,
    required this.occupation,
    required this.incSlab,
    required this.idType1,
    required this.srceWealth,
    required this.networth,
    required this.networthDate,
    required this.nominee,
    required this.nomineeRelation,
    required this.nomineeDob,
    required this.nomineeGuardian,
    required this.motherName,
    required this.fatherName,
    required this.addr1,
    required this.addr2,
    required this.addr3,
    required this.district,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
    required this.addrType,
    required this.birthCountry,
    required this.birthPlace,
    required this.politicallyExposed,
    required this.politicallyRelated,
    required this.status,
    required this.isActive,
    required this.kycStatus,
    required this.isKycDone,
    required this.isFactaDone,
    required this.completedPart,
    required this.isBseClientCreated,
    required this.isGoldAccountCreated,
    required this.isBankAddedForGold,
    required this.isGoldKycSubmit,
    required this.goldKycStatus,
  });

  int id;
  int insId;
  String fName;
  String mName;
  String lName;
  String panName;
  String email;
  String emailVerified;
  String gender;
  int phoneCode;
  int phoneNumber;
  int phoneVerified;
  String riskProfileSetDate;
  String dob;
  String pan;
  String bseClientCode;
  String accType1;
  String accNo1;
  String bankName1;
  String micrNo1;
  String ifscCode1;
  String bankBranch1;
  String defaultbank1;
  String taxRes1;
  String tpin1;
  String riskType;
  String riskScore;
  String occupation;
  String incSlab;
  String idType1;
  String srceWealth;
  String networth;
  String networthDate;
  String nominee;
  String nomineeRelation;
  String nomineeDob;
  String nomineeGuardian;
  String motherName;
  String fatherName;
  String addr1;
  String addr2;
  String addr3;
  String district;
  String city;
  String state;
  String country;
  String pincode;
  String addrType;
  String birthCountry;
  String birthPlace;
  String politicallyExposed;
  String politicallyRelated;
  String status;
  int isActive;
  String kycStatus;
  int isKycDone;
  int isFactaDone;
  String completedPart;
  int isBseClientCreated;
  int isGoldAccountCreated;
  int isBankAddedForGold;
  int isGoldKycSubmit;
  String goldKycStatus;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        id: json["id"] == null ? 0 : json["id"],
        insId: json["insId"] == null ? '' : json["insId"],
        fName: json["fName"] == null ? '' : json["fName"],
        mName: json["mName"] == null ? '' : json["mName"],
        lName: json["lName"] == null ? '' : json["lName"],
        panName: json["PANName"] == null ? '' : json["PANName"],
        email: json["email"] == null ? null : json["email"],
        emailVerified:
            json["emailVerified"] == null ? '' : json["emailVerified"],
        gender: json["gender"] == null ? '' : json["gender"],
        phoneCode: json["phoneCode"] == null ? 0 : json["phoneCode"],
        phoneNumber: json["phoneNumber"] == null ? 0 : json["phoneNumber"],
        phoneVerified:
            json["phoneVerified"] == null ? 0 : json["phoneVerified"],
        riskProfileSetDate: json["riskProfileSetDate"] == null
            ? ''
            : json["riskProfileSetDate"],
        dob: json["dob"] == null ? '' : json["dob"],
        pan: json["pan"] == null ? '' : json["pan"],
        bseClientCode:
            json["bseClientCode"] == null ? '' : json["bseClientCode"],
        accType1: json["accType1"] == null ? '' : json["accType1"],
        accNo1: json["accNo1"] == null ? '' : json["accNo1"],
        bankName1: json["bankName1"] == null ? '' : json["bankName1"],
        micrNo1: json["micrNo1"] == null ? '' : json["micrNo1"],
        ifscCode1: json["ifscCode1"] == null ? '' : json["ifscCode1"],
        bankBranch1: json["bankBranch1"] == null ? '' : json["bankBranch1"],
        defaultbank1: json["defaultbank1"] == null ? '' : json["defaultbank1"],
        taxRes1: json["taxRes1"] == null ? '' : json["taxRes1"],
        tpin1: json["tpin1"] == null ? '' : json["tpin1"],
        riskType: json["riskType"] == null ? '' : json["riskType"],
        riskScore: json["riskScore"].toString() == null
            ? ''
            : json["riskScore"].toString(),
        occupation: json["occupation"] == null ? '' : json["occupation"],
        incSlab: json["incSlab"] == null ? '' : json["incSlab"],
        idType1: json["idType1"] == null ? '' : json["idType1"],
        srceWealth: json["srceWealth"] == null ? '' : json["srceWealth"],
        networth: json["networth"] == null ? '' : json["networth"],
        networthDate: json["networthDate"] == null ? '' : json["networthDate"],
        nominee: json["nominee"] == null ? '' : json["nominee"],
        nomineeRelation:
            json["nomineeRelation"] == null ? '' : json["nomineeRelation"],
        nomineeDob: json["nomineeDob"] == null ? '' : json["nomineeDob"],
        nomineeGuardian:
            json["nomineeGuardian"] == null ? '' : json["nomineeGuardian"],
        motherName: json["motherName"] == null ? '' : json["motherName"],
        fatherName: json["fatherName"] == null ? '' : json["fatherName"],
        addr1: json["addr1"] == null ? '' : json["addr1"],
        addr2: json["addr2"] == null ? '' : json["addr2"],
        addr3: json["addr3"] == null ? '' : json["addr3"],
        district: json["district"] == null ? '' : json["district"],
        city: json["city"] == null ? '' : json["city"],
        state: json["state"] == null ? '' : json["state"],
        country: json["country"] == null ? '' : json["country"],
        pincode: json["pincode"] == null ? '' : json["pincode"],
        addrType: json["addrType"] == null ? '' : json["addrType"],
        birthCountry: json["birthCountry"] == null ? '' : json["birthCountry"],
        birthPlace: json["birthPlace"] == null ? '' : json["birthPlace"],
        politicallyExposed: json["politicallyExposed"] == null
            ? ''
            : json["politicallyExposed"],
        politicallyRelated: json["politicallyRelated"] == null
            ? ''
            : json["politicallyRelated"],
        status: json["status"] == null ? '' : json["status"],
        isActive: json["isActive"] == null ? 0 : json["isActive"],
        kycStatus: json["kycStatus"] == null ? '' : json["kycStatus"],
        isKycDone: json["isKycDone"] == null ? 0 : json["isKycDone"],
        isFactaDone: json["IsFactaDone"] == null ? 0 : json["IsFactaDone"],
        completedPart:
            json["completedPart"] == null ? '' : json["completedPart"],
        isBseClientCreated:
            json["isBseClientCreated"] == null ? 0 : json["isBseClientCreated"],
        isGoldAccountCreated: json["isGoldAccountCreated"] == null
            ? 0
            : json["isGoldAccountCreated"],
        isBankAddedForGold:
            json["isBankAddedForGold"] == null ? 0 : json["isBankAddedForGold"],
        isGoldKycSubmit:
            json["isGoldKycSubmit"] == null ? 0 : json["isGoldKycSubmit"],
        goldKycStatus:
            json["goldKycStatus"] == null ? '' : json["goldKycStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "insId": insId == null ? null : insId,
        "fName": fName == null ? null : fName,
        "mName": mName == null ? null : mName,
        "lName": lName == null ? null : lName,
        "PANName": panName == null ? null : panName,
        "email": email == null ? null : email,
        "emailVerified": emailVerified == null ? null : emailVerified,
        "gender": gender == null ? null : gender,
        "phoneCode": phoneCode == null ? null : phoneCode,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "phoneVerified": phoneVerified == null ? null : phoneVerified,
        "riskProfileSetDate":
            riskProfileSetDate == null ? null : riskProfileSetDate,
        "dob": dob == null ? null : dob,
        "pan": pan == null ? null : pan,
        "bseClientCode": bseClientCode == null ? null : bseClientCode,
        "accType1": accType1 == null ? null : accType1,
        "accNo1": accNo1 == null ? null : accNo1,
        "bankName1": bankName1 == null ? null : bankName1,
        "micrNo1": micrNo1 == null ? null : micrNo1,
        "ifscCode1": ifscCode1 == null ? null : ifscCode1,
        "bankBranch1": bankBranch1 == null ? null : bankBranch1,
        "defaultbank1": defaultbank1 == null ? null : defaultbank1,
        "taxRes1": taxRes1 == null ? null : taxRes1,
        "tpin1": tpin1 == null ? null : tpin1,
        "riskType": riskType == null ? null : riskType,
        "riskScore": riskScore == null ? null : riskScore,
        "occupation": occupation == null ? null : occupation,
        "incSlab": incSlab == null ? null : incSlab,
        "idType1": idType1 == null ? null : idType1,
        "srceWealth": srceWealth == null ? null : srceWealth,
        "networth": networth == null ? null : networth,
        "networthDate": networthDate == null ? null : networthDate,
        "nominee": nominee == null ? null : nominee,
        "nomineeRelation": nomineeRelation == null ? null : nomineeRelation,
        "nomineeDob": nomineeDob == null ? null : nomineeDob,
        "nomineeGuardian": nomineeGuardian == null ? null : nomineeGuardian,
        "motherName": motherName == null ? null : motherName,
        "fatherName": fatherName == null ? null : fatherName,
        "addr1": addr1 == null ? null : addr1,
        "addr2": addr2 == null ? null : addr2,
        "addr3": addr3 == null ? null : addr3,
        "district": district == null ? null : district,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "pincode": pincode == null ? null : pincode,
        "addrType": addrType == null ? null : addrType,
        "birthCountry": birthCountry == null ? null : birthCountry,
        "birthPlace": birthPlace == null ? null : birthPlace,
        "politicallyExposed":
            politicallyExposed == null ? null : politicallyExposed,
        "politicallyRelated":
            politicallyRelated == null ? null : politicallyRelated,
        "status": status == null ? null : status,
        "isActive": isActive == null ? null : isActive,
        "kycStatus": kycStatus == null ? null : kycStatus,
        "isKycDone": isKycDone == null ? null : isKycDone,
        "IsFactaDone": isFactaDone == null ? null : isFactaDone,
        "completedPart": completedPart == null ? null : completedPart,
        "isBseClientCreated":
            isBseClientCreated == null ? null : isBseClientCreated,
        "isGoldAccountCreated":
            isGoldAccountCreated == null ? null : isGoldAccountCreated,
        "isBankAddedForGold":
            isBankAddedForGold == null ? null : isBankAddedForGold,
        "isGoldKycSubmit": isGoldKycSubmit == null ? null : isGoldKycSubmit,
        "goldKycStatus": goldKycStatus == null ? null : goldKycStatus,
      };
}
