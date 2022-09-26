import 'dart:convert';

MutualFundCategoryModel mutualFundCategoryModelFromJson(String str) =>
    MutualFundCategoryModel.fromJson(json.decode(str));

String mutualFundCategoryModelToJson(MutualFundCategoryModel data) =>
    json.encode(data.toJson());

class MutualFundCategoryModel {
  MutualFundCategoryModel({
    required this.all,
    required this.equity,
    required this.debt,
    required this.hybrid,
    required this.commodities,
  });

  List<String> all;
  List<String> equity;
  List<String> debt;
  List<String> hybrid;
  List<String> commodities;

  factory MutualFundCategoryModel.fromJson(Map<String, dynamic> json) =>
      MutualFundCategoryModel(
        all: List<String>.from(json["All"].map((x) => x)),
        equity: List<String>.from(json["Equity"].map((x) => x)),
        debt: List<String>.from(json["Debt"].map((x) => x)),
        hybrid: List<String>.from(json["Hybrid"].map((x) => x)),
        commodities: List<String>.from(json["Commodities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "All": List<dynamic>.from(all.map((x) => x)),
        "Equity": List<dynamic>.from(equity.map((x) => x)),
        "Debt": List<dynamic>.from(debt.map((x) => x)),
        "Hybrid": List<dynamic>.from(hybrid.map((x) => x)),
        "Commodities": List<dynamic>.from(commodities.map((x) => x)),
      };
}
