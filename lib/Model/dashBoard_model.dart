// To parse this JSON data, do
//
//     final getDashboardModel = getDashboardModelFromJson(jsonString);

import 'dart:convert';

GetDashboardModel getDashboardModelFromJson(String str) => GetDashboardModel.fromJson(json.decode(str));

String getDashboardModelToJson(GetDashboardModel data) => json.encode(data.toJson());

class GetDashboardModel {
  GetDashboardModel({
    required this.noInvestment,
    required this.statistics,
  });

  bool noInvestment;
  Statistics statistics;

  factory GetDashboardModel.fromJson(Map<String, dynamic> json) => GetDashboardModel(
    noInvestment: json["noInvestment"],
    statistics: Statistics.fromJson(json["statistics"]),
  );

  Map<String, dynamic> toJson() => {
    "noInvestment": noInvestment,
    "statistics": statistics.toJson(),
  };
}

class Statistics {
  Statistics({
    required this.funds,
    required this.totalInvestment,
    required this.totalCurrentValue,
    required this.formattedTotalInvestment,
    required this.formattedCurrentValue,
    required this.totalIrr,
    required this.categoryPercent,
  });

  Funds funds;
  int totalInvestment;
  int totalCurrentValue;
  int formattedTotalInvestment;
  int formattedCurrentValue;
  int totalIrr;
  CategoryPercent categoryPercent;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    funds: Funds.fromJson(json["funds"]),
    totalInvestment: json["totalInvestment"],
    totalCurrentValue: json["totalCurrentValue"],
    formattedTotalInvestment: json["formattedTotalInvestment"],
    formattedCurrentValue: json["formattedCurrentValue"],
    totalIrr: json["totalIrr"],
    categoryPercent: CategoryPercent.fromJson(json["categoryPercent"]),
  );

  Map<String, dynamic> toJson() => {
    "funds": funds.toJson(),
    "totalInvestment": totalInvestment,
    "totalCurrentValue": totalCurrentValue,
    "formattedTotalInvestment": formattedTotalInvestment,
    "formattedCurrentValue": formattedCurrentValue,
    "totalIrr": totalIrr,
    "categoryPercent": categoryPercent.toJson(),
  };
}

class CategoryPercent {
  CategoryPercent({
    required this.debt,
    required this.equity,
    required this.hybrid,
  });

  int debt;
  int equity;
  int hybrid;

  factory CategoryPercent.fromJson(Map<String, dynamic> json) => CategoryPercent(
    debt: json["Debt"],
    equity: json["Equity"],
    hybrid: json["Hybrid"],
  );

  Map<String, dynamic> toJson() => {
    "Debt": debt,
    "Equity": equity,
    "Hybrid": hybrid,
  };
}

class Funds {
  Funds();

  factory Funds.fromJson(Map<String, dynamic> json) => Funds(
  );

  Map<String, dynamic> toJson() => {
  };
}
