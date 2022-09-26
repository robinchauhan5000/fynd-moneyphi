import 'dart:convert';

MutualFundModel mutualFundModelFromJson(String str) =>
    MutualFundModel.fromJson(json.decode(str));

String mutualFundModelToJson(MutualFundModel data) =>
    json.encode(data.toJson());

class MutualFundModel {
  MutualFundModel({
    required this.count,
    required this.funds,
  });

  int count;
  List<Fund> funds;

  factory MutualFundModel.fromJson(Map<String, dynamic> json) =>
      MutualFundModel(
        count: json["count"],
        funds: List<Fund>.from(json["funds"].map((x) => Fund.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "funds": List<dynamic>.from(funds.map((x) => x.toJson())),
      };
}

class Fund {
  Fund({
    required this.fundId,
    required this.fundName,
    required this.fundIsin,
    required this.fundBseCode,
    required this.minSipAmnt,
    required this.amcid,
    required this.latestNav,
    required this.navDate,
    required this.catId,
    required this.displayCatName,
    required this.broadCat,
    required this.navChange,
    required this.return1D,
    required this.return1Yr,
    required this.return3Yr,
    required this.return5Yr,
    required this.watchListId,
    required this.formattedLatestNav,
    required this.formattedMinSipAmnt,
  });

  int fundId;
  String fundName;
  String fundIsin;
  String fundBseCode;
  int minSipAmnt;
  int amcid;
  double latestNav;
  DateTime navDate;
  int catId;
  String displayCatName;
  String? broadCat;
  double navChange;
  double return1D;
  double return1Yr;
  double return3Yr;
  double return5Yr;
  dynamic watchListId;
  String formattedLatestNav;
  String? formattedMinSipAmnt;

  factory Fund.fromJson(Map<String, dynamic> json) => Fund(
        fundId: json["fundId"],
        fundName: json["fundName"],
        fundIsin: json["fundIsin"],
        fundBseCode: json["fundBseCode"] ?? '  ',
        minSipAmnt: json["minSIPAmnt"] == null ? 0 : json["minSIPAmnt"],
        amcid: json["amcid"],
        latestNav: json["latestNav"].toDouble(),
        navDate: DateTime.parse(json["navDate"]),
        catId: json["catId"] == null ? 0 : json["catId"],
        displayCatName: json["displayCatName"],
        broadCat: json["broadCat"],
        navChange: json["navChange"].toDouble(),
        return1D: json["return1d"].toDouble(),
        return1Yr:
            json["return1yr"] == null ? 0.0 : json["return1yr"].toDouble(),
        return3Yr:
            json["return3yr"] == null ? 0.0 : json["return3yr"].toDouble(),
        return5Yr:
            json["return5yr"] == null ? 0.0 : json["return5yr"].toDouble(),
        watchListId: json["watchListId"],
        formattedLatestNav: json["formatted_latestNav"],
        formattedMinSipAmnt: json["formatted_minSIPAmnt"],
      );

  Map<String, dynamic> toJson() => {
        "fundId": fundId,
        "fundName": fundName,
        "fundIsin": fundIsin,
        "fundBseCode": fundBseCode,
        "minSIPAmnt": minSipAmnt,
        "amcid": amcid,
        "latestNav": latestNav,
        "navDate":
            "${navDate.year.toString().padLeft(4, '0')}-${navDate.month.toString().padLeft(2, '0')}-${navDate.day.toString().padLeft(2, '0')}",
        "catId": catId == null ? 0 : catId,
        "displayCatName": displayCatName,
        "broadCat": broadCat,
        "navChange": navChange,
        "return1d": return1D,
        "return1yr": return1Yr == null ? 0.0 : return1Yr,
        "return3yr": return3Yr == null ? 0.0 : return3Yr,
        "return5yr": return5Yr == null ? 0.0 : return5Yr,
        "watchListId": watchListId,
        "formatted_latestNav": formattedLatestNav,
        "formatted_minSIPAmnt": formattedMinSipAmnt,
      };
}
