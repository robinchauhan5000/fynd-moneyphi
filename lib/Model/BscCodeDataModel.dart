// import 'dart:convert';
//
// class BscCodeModel {
//   BscCodeModel({
//     required this.success,
//     required this.data,
//   });
//
//   bool success;
//   Data data;
//
//   factory BscCodeModel.fromRawJson(String str) =>
//       BscCodeModel.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory BscCodeModel.fromJson(Map<String, dynamic> json) => BscCodeModel(
//         success: json["success"],
//         data: Data.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "data": data.toJson(),
//       };
// }
//
// class Data {
//   Data({
//     required this.taxStatus,
//     required this.addrtype,
//     required this.country,
//     required this.states,
//     required this.idproof,
//     required this.occupation,
//   });
//
//   List<Country> taxStatus;
//   List<Addrtype> addrtype;
//   List<Country> country;
//   List<Country> states;
//   List<Country> idproof;
//   List<Country> occupation;
//
//   factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         taxStatus: List<Country>.from(
//             json["taxStatus"].map((x) => Country.fromJson(x))),
//         addrtype: List<Addrtype>.from(
//             json["addrtype"].map((x) => Addrtype.fromJson(x))),
//         country:
//             List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
//         states:
//             List<Country>.from(json["states"].map((x) => Country.fromJson(x))),
//         idproof:
//             List<Country>.from(json["idproof"].map((x) => Country.fromJson(x))),
//         occupation: List<Country>.from(
//             json["occupation"].map((x) => Country.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "taxStatus": List<dynamic>.from(taxStatus.map((x) => x.toJson())),
//         "addrtype": List<dynamic>.from(addrtype.map((x) => x.toJson())),
//         "country": List<dynamic>.from(country.map((x) => x.toJson())),
//         "states": List<dynamic>.from(states.map((x) => x.toJson())),
//         "idproof": List<dynamic>.from(idproof.map((x) => x.toJson())),
//         "occupation": List<dynamic>.from(occupation.map((x) => x.toJson())),
//       };
// }
//
// class Addrtype {
//   Addrtype({
//     required this.id,
//     required this.name,
//   });
//
//   int id;
//   String name;
//
//   factory Addrtype.fromRawJson(String str) =>
//       Addrtype.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Addrtype.fromJson(Map<String, dynamic> json) => Addrtype(
//         id: json["id"],
//         name: json["name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };
// }
//
// class Country {
//   Country({
//     required this.id,
//     required this.name,
//   });
//
//   String id;
//   String name;
//
//   factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Country.fromJson(Map<String, dynamic> json) => Country(
//         id: json["id"],
//         name: json["name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//       };
//
//   @override
//   String toString() {
//     return '$name, $id';
//   }
// }

// To parse this JSON data, do
//
//     final bscCodeModel = bscCodeModelFromJson(jsonString);

import 'dart:convert';

BscCodeModel bscCodeModelFromJson(String str) =>
    BscCodeModel.fromJson(json.decode(str));

String bscCodeModelToJson(BscCodeModel data) => json.encode(data.toJson());

class BscCodeModel {
  BscCodeModel({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory BscCodeModel.fromJson(Map<String, dynamic> json) => BscCodeModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.taxStatus,
    required this.addrtype,
    required this.country,
    required this.states,
    required this.idproof,
    required this.occupation,
    required this.incSlab,
    required this.sourceOfWealth,
    required this.mobileDeclaration,
    required this.emailDeclaration,
  });

  List<Country> taxStatus;
  List<Addrtype> addrtype;
  List<Country> country;
  List<Country> states;
  List<Country> idproof;
  List<Country> occupation;
  List<IncSlab> incSlab;
  List<Country> sourceOfWealth;
  List<Country> mobileDeclaration;
  List<Country> emailDeclaration;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        taxStatus: List<Country>.from(
            json["taxStatus"].map((x) => Country.fromJson(x))),
        addrtype: List<Addrtype>.from(
            json["addrtype"].map((x) => Addrtype.fromJson(x))),
        country:
            List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
        states:
            List<Country>.from(json["states"].map((x) => Country.fromJson(x))),
        idproof:
            List<Country>.from(json["idproof"].map((x) => Country.fromJson(x))),
        occupation: List<Country>.from(
            json["occupation"].map((x) => Country.fromJson(x))),
        incSlab:
            List<IncSlab>.from(json["incSlab"].map((x) => IncSlab.fromJson(x))),
        sourceOfWealth: List<Country>.from(
            json["sourceOfWealth"].map((x) => Country.fromJson(x))),
        mobileDeclaration: List<Country>.from(
            json["mobileDeclaration"].map((x) => Country.fromJson(x))),
        emailDeclaration: List<Country>.from(
            json["emailDeclaration"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "taxStatus": List<dynamic>.from(taxStatus.map((x) => x.toJson())),
        "addrtype": List<dynamic>.from(addrtype.map((x) => x.toJson())),
        "country": List<dynamic>.from(country.map((x) => x.toJson())),
        "states": List<dynamic>.from(states.map((x) => x.toJson())),
        "idproof": List<dynamic>.from(idproof.map((x) => x.toJson())),
        "occupation": List<dynamic>.from(occupation.map((x) => x.toJson())),
        "incSlab": List<dynamic>.from(incSlab.map((x) => x.toJson())),
        "sourceOfWealth":
            List<dynamic>.from(sourceOfWealth.map((x) => x.toJson())),
        "mobileDeclaration":
            List<dynamic>.from(mobileDeclaration.map((x) => x.toJson())),
        "emailDeclaration":
            List<dynamic>.from(emailDeclaration.map((x) => x.toJson())),
      };
}

class Addrtype {
  Addrtype({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Addrtype.fromJson(Map<String, dynamic> json) => Addrtype(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Country {
  Country({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class IncSlab {
  IncSlab({
    required this.id,
    required this.income,
    required this.displayName,
  });

  String id;
  String income;
  String displayName;

  factory IncSlab.fromJson(Map<String, dynamic> json) => IncSlab(
        id: json["id"],
        income: json["income"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "income": income,
        "displayName": displayName,
      };
}
