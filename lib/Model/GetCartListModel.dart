import 'dart:convert';

GetCartListModel getCartListModelFromJson(String str) =>
    GetCartListModel.fromJson(json.decode(str));

String getCartListModelToJson(GetCartListModel data) =>
    json.encode(data.toJson());

class GetCartListModel {
  GetCartListModel({
    this.cart,
  });

  Cart? cart;

  factory GetCartListModel.fromJson(Map<String, dynamic> json) =>
      GetCartListModel(
        cart: Cart.fromJson(json["cart"]),
      );

  Map<String, dynamic> toJson() => {
        "cart": cart!.toJson(),
      };
}

class Cart {
  Cart({
    required this.goals,
    required this.uniqueFunds,
  });

  List<Goal> goals;
  UniqueFunds uniqueFunds;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        goals: List<Goal>.from(json["goals"].map((x) => Goal.fromJson(x))),
        uniqueFunds: UniqueFunds.fromJson(json["uniqueFunds"]),
      );

  Map<String, dynamic> toJson() => {
        "goals": List<dynamic>.from(goals.map((x) => x.toJson())),
        "uniqueFunds": uniqueFunds.toJson(),
      };
}

class Goal {
  Goal({
    required this.goalName,
    required this.goalType,
    required this.years,
    required this.totalInstallments,
    required this.goalId,
    required this.inputId,
    required this.totalAmount,
    required this.investmentType,
    required this.firstTimeFund,
    required this.funds,
    required this.commonDates,
  });

  String goalName;
  String goalType;
  int years;
  int totalInstallments;
  int goalId;
  int inputId;
  int totalAmount;
  String investmentType;
  bool firstTimeFund;
  List<Fund> funds;
  List<int> commonDates;

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        goalName: json["goalName"],
        goalType: json["goalType"],
        years: json["years"],
        totalInstallments: json["totalInstallments"],
        goalId: json["goalId"],
        inputId: json["inputId"],
        totalAmount: json["totalAmount"],
        investmentType: json["investmentType"],
        firstTimeFund: json["firstTimeFund"],
        funds: List<Fund>.from(json["funds"].map((x) => Fund.fromJson(x))),
        commonDates: List<int>.from(json["commonDates"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "goalName": goalName,
        "goalType": goalType,
        "years": years,
        "totalInstallments": totalInstallments,
        "goalId": goalId,
        "inputId": inputId,
        "totalAmount": totalAmount,
        "investmentType": investmentType,
        "firstTimeFund": firstTimeFund,
        "funds": List<dynamic>.from(funds.map((x) => x.toJson())),
        "commonDates": List<dynamic>.from(commonDates.map((x) => x)),
      };
}

class Fund {
  Fund({
    required this.fundId,
    required this.fundName,
    required this.isin,
    required this.fundBseCode,
    required this.minInvestment,
    required this.amount,
    required this.investmentType,
    required this.sipDates,
    required this.isChildOpen,
  });

  int fundId;
  String fundName;
  String isin;
  String fundBseCode;
  int minInvestment;
  int amount;
  String investmentType;
  List<int> sipDates;
  bool isChildOpen;

  factory Fund.fromJson(Map<String, dynamic> json) => Fund(
        fundId: json["fundId"],
        fundName: json["fundName"],
        isin: json["isin"],
        fundBseCode: json["fundBseCode"],
        minInvestment: json["minInvestment"],
        amount: json["amount"],
        investmentType: json["investmentType"],
        sipDates: List<int>.from(json["sipDates"].map((x) => x)),
        isChildOpen: json["isChildOpen"],
      );

  Map<String, dynamic> toJson() => {
        "fundId": fundId,
        "fundName": fundName,
        "isin": isin,
        "fundBseCode": fundBseCode,
        "minInvestment": minInvestment,
        "amount": amount,
        "investmentType": investmentType,
        "sipDates": List<dynamic>.from(sipDates.map((x) => x)),
        "isChildOpen": isChildOpen,
      };
}

class UniqueFunds {
  UniqueFunds({
    required this.sips,
    required this.lumpsum,
  });

  List<Sip> sips;
  List<dynamic> lumpsum;

  factory UniqueFunds.fromJson(Map<String, dynamic> json) => UniqueFunds(
        sips: List<Sip>.from(json["sips"].map((x) => Sip.fromJson(x))),
        lumpsum: List<dynamic>.from(json["lumpsum"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "sips": List<dynamic>.from(sips.map((x) => x.toJson())),
        "lumpsum": List<dynamic>.from(lumpsum.map((x) => x)),
      };
}

class Sip {
  Sip({
    required this.fundId,
    required this.noOfInstallments,
    required this.fundName,
    required this.isin,
    required this.selectedFolio,
    required this.folioNumber,
    required this.fundBseCode,
    required this.investmentType,
    required this.minInvestment,
    required this.amount,
    required this.sipDates,
  });

  int fundId;
  int noOfInstallments;
  String fundName;
  String isin;
  String selectedFolio;
  List<dynamic> folioNumber;
  String fundBseCode;
  String investmentType;
  int minInvestment;
  int amount;
  List<int> sipDates;

  factory Sip.fromJson(Map<String, dynamic> json) => Sip(
        fundId: json["fundId"],
        noOfInstallments: json["noOfInstallments"],
        fundName: json["fundName"],
        isin: json["isin"],
        selectedFolio: json["selectedFolio"],
        folioNumber: List<dynamic>.from(json["folioNumber"].map((x) => x)),
        fundBseCode: json["fundBseCode"],
        investmentType: json["investmentType"],
        minInvestment: json["minInvestment"],
        amount: json["amount"],
        sipDates: List<int>.from(json["sipDates"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "fundId": fundId,
        "noOfInstallments": noOfInstallments,
        "fundName": fundName,
        "isin": isin,
        "selectedFolio": selectedFolio,
        "folioNumber": List<dynamic>.from(folioNumber.map((x) => x)),
        "fundBseCode": fundBseCode,
        "investmentType": investmentType,
        "minInvestment": minInvestment,
        "amount": amount,
        "sipDates": List<dynamic>.from(sipDates.map((x) => x)),
      };
}
