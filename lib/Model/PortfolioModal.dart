class PortfolioModal {
  List<Funds>? funds;
  double? totalInvestment;
  double? totalCurrentValue;
  String? formattedTotalInvestment;
  String? formattedCurrentValue;
  double? totalIrr;
  CategoryPercent? categoryPercent;

  PortfolioModal(
      {this.funds,
      this.totalInvestment,
      this.totalCurrentValue,
      this.formattedTotalInvestment,
      this.formattedCurrentValue,
      this.totalIrr,
      this.categoryPercent});

  PortfolioModal.fromJson(Map<String, dynamic> json) {
    if (json['funds'] != null) {
      funds = <Funds>[];
      json['funds'].forEach((v) {
        funds!.add(new Funds.fromJson(v));
      });
    }
    totalInvestment = json['totalInvestment'];
    totalCurrentValue = json['totalCurrentValue'];
    formattedTotalInvestment = json['formattedTotalInvestment'];
    formattedCurrentValue = json['formattedCurrentValue'];
    totalIrr = json['totalIrr'];
    categoryPercent = json['categoryPercent'] != null
        ? new CategoryPercent.fromJson(json['categoryPercent'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.funds != null) {
      data['funds'] = this.funds!.map((v) => v.toJson()).toList();
    }
    data['totalInvestment'] = this.totalInvestment;
    data['totalCurrentValue'] = this.totalCurrentValue;
    data['formattedTotalInvestment'] = this.formattedTotalInvestment;
    data['formattedCurrentValue'] = this.formattedCurrentValue;
    data['totalIrr'] = this.totalIrr;
    if (this.categoryPercent != null) {
      data['categoryPercent'] = this.categoryPercent!.toJson();
    }
    return data;
  }
}

class Funds {
  String? isin;
  double? totalAmount;
  double? totalUnits;
  List<String>? exitLoad;
  double? currentValue;
  String? formattedCurrentValue;
  String? formattedTotalAmount;
  double? gainOrLoss;
  String? formattedGainOrLoss;
  String? gainOrLossText;
  String? gainOrLossPercentage;
  String? irr;
  CategoryRatio? categoryRatio;
  FundObj? fundObj;
  List<Sips>? sips;

  Funds(
      {this.isin,
      this.totalAmount,
      this.totalUnits,
      this.exitLoad,
      this.currentValue,
      this.formattedCurrentValue,
      this.formattedTotalAmount,
      this.gainOrLoss,
      this.formattedGainOrLoss,
      this.gainOrLossText,
      this.gainOrLossPercentage,
      this.irr,
      this.categoryRatio,
      this.fundObj,
      this.sips});

  Funds.fromJson(Map<String, dynamic> json) {
    isin = json['isin'];
    totalAmount = json['totalAmount'];
    totalUnits = json['totalUnits'];
    exitLoad = json['exitLoad'].cast<String>();
    currentValue = json['currentValue'];
    formattedCurrentValue = json['formattedCurrentValue'];
    formattedTotalAmount = json['formattedTotalAmount'];
    gainOrLoss = json['gainOrLoss'];
    formattedGainOrLoss = json['formattedGainOrLoss'];
    gainOrLossText = json['gainOrLossText'];
    gainOrLossPercentage = json['gainOrLossPercentage'];
    irr = json['irr'];
    categoryRatio = json['categoryRatio'] != null
        ? new CategoryRatio.fromJson(json['categoryRatio'])
        : null;
    fundObj =
        json['fundObj'] != null ? new FundObj.fromJson(json['fundObj']) : null;
    if (json['sips'] != null) {
      sips = <Sips>[];
      json['sips'].forEach((v) {
        sips!.add(new Sips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isin'] = this.isin;
    data['totalAmount'] = this.totalAmount;
    data['totalUnits'] = this.totalUnits;
    data['exitLoad'] = this.exitLoad;
    data['currentValue'] = this.currentValue;
    data['formattedCurrentValue'] = this.formattedCurrentValue;
    data['formattedTotalAmount'] = this.formattedTotalAmount;
    data['gainOrLoss'] = this.gainOrLoss;
    data['formattedGainOrLoss'] = this.formattedGainOrLoss;
    data['gainOrLossText'] = this.gainOrLossText;
    data['gainOrLossPercentage'] = this.gainOrLossPercentage;
    data['irr'] = this.irr;
    if (this.categoryRatio != null) {
      data['categoryRatio'] = this.categoryRatio!.toJson();
    }
    if (this.fundObj != null) {
      data['fundObj'] = this.fundObj!.toJson();
    }
    if (this.sips != null) {
      data['sips'] = this.sips!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryRatio {
  String? name;
  double? ratio;

  CategoryRatio({this.name, this.ratio});

  CategoryRatio.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    ratio = json['ratio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['ratio'] = this.ratio;
    return data;
  }
}

class FundObj {
  int? id;
  String? name;
  String? displayCatName;
  String? broadCat;
  int? minRedemptionAmnt;
  double? latestNav;
  String? navDate;
  String? isin;
  String? imgPrefix;
  String? image;

  FundObj(
      {this.id,
      this.name,
      this.displayCatName,
      this.broadCat,
      this.minRedemptionAmnt,
      this.latestNav,
      this.navDate,
      this.isin,
      this.imgPrefix,
      this.image});

  FundObj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayCatName = json['displayCatName'];
    broadCat = json['broadCat'];
    minRedemptionAmnt = json['minRedemptionAmnt'];
    latestNav = json['latestNav'];
    navDate = json['navDate'];
    isin = json['isin'];
    imgPrefix = json['imgPrefix'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['displayCatName'] = this.displayCatName;
    data['broadCat'] = this.broadCat;
    data['minRedemptionAmnt'] = this.minRedemptionAmnt;
    data['latestNav'] = this.latestNav;
    data['navDate'] = this.navDate;
    data['isin'] = this.isin;
    data['imgPrefix'] = this.imgPrefix;
    data['image'] = this.image;
    return data;
  }
}

class Sips {
  int? amount;
  int? date;
  int? fsmId;
  int? fundId;
  List<GoalBinded>? goalBinded;
  String? status;

  Sips(
      {this.amount,
      this.date,
      this.fsmId,
      this.fundId,
      this.goalBinded,
      this.status});

  Sips.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    date = json['date'];
    fsmId = json['fsmId'];
    fundId = json['fundId'];
    if (json['goalBinded'] != null) {
      goalBinded = <GoalBinded>[];
      json['goalBinded'].forEach((v) {
        goalBinded!.add(new GoalBinded.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['date'] = this.date;
    data['fsmId'] = this.fsmId;
    data['fundId'] = this.fundId;
    if (this.goalBinded != null) {
      data['goalBinded'] = this.goalBinded!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class GoalBinded {
  int? goalId;
  String? goalName;
  String? goalType;
  int? goalAmount;
  int? userGoalId;
  int? yearsForGoal;
  int? customizedSIP;
  int? sipPercentage;

  GoalBinded(
      {this.goalId,
      this.goalName,
      this.goalType,
      this.goalAmount,
      this.userGoalId,
      this.yearsForGoal,
      this.customizedSIP,
      this.sipPercentage});

  GoalBinded.fromJson(Map<String, dynamic> json) {
    goalId = json['goalId'];
    goalName = json['goalName'];
    goalType = json['goalType'];
    goalAmount = json['goalAmount'];
    userGoalId = json['userGoalId'];
    yearsForGoal = json['yearsForGoal'];
    customizedSIP = json['customizedSIP'];
    sipPercentage = json['sipPercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goalId'] = this.goalId;
    data['goalName'] = this.goalName;
    data['goalType'] = this.goalType;
    data['goalAmount'] = this.goalAmount;
    data['userGoalId'] = this.userGoalId;
    data['yearsForGoal'] = this.yearsForGoal;
    data['customizedSIP'] = this.customizedSIP;
    data['sipPercentage'] = this.sipPercentage;
    return data;
  }
}

class CategoryPercent {
  double? equity;
  double? hybrid;
  double? debt;

  CategoryPercent({this.equity, this.hybrid, this.debt});

  CategoryPercent.fromJson(Map<String, dynamic> json) {
    equity = json['Equity'];
    hybrid = json['Hybrid'];
    debt = json['Debt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Equity'] = this.equity;
    data['Hybrid'] = this.hybrid;
    data['Debt'] = this.debt;
    return data;
  }
}
