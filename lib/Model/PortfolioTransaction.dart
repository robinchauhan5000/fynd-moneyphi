class PortfolioTransactionModel {
  Data? data;
  Summary? summary;
  List<Redemption>? redemption;

  PortfolioTransactionModel({this.data, this.summary, this.redemption});

  PortfolioTransactionModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    if (json['redemption'] != null) {
      redemption = <Redemption>[];
      json['redemption'].forEach((v) {
        redemption!.add(new Redemption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    if (this.redemption != null) {
      data['redemption'] = this.redemption!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Fund? fund;
  List<Transactions>? transactions;

  Data({this.fund, this.transactions});

  Data.fromJson(Map<String, dynamic> json) {
    fund = json['fund'] != null ? new Fund.fromJson(json['fund']) : null;
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fund != null) {
      data['fund'] = this.fund!.toJson();
    }
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fund {
  String? name;
  double? nav;
  String? formattedNav;
  String? imgPrefix;
  String? category;
  String? subCategory;
  double? navChange;
  double? navChangePerc;
  String? date;
  int? minRedemptionAmount;
  int? totalInvestment;
  double? totalMarketValue;
  String? formattedTotalInvestment;
  String? formattedTotalMarketValue;
  double? totalUnits;
  double? irr;

  Fund(
      {this.name,
      this.nav,
      this.formattedNav,
      this.imgPrefix,
      this.category,
      this.subCategory,
      this.navChange,
      this.navChangePerc,
      this.date,
      this.minRedemptionAmount,
      this.totalInvestment,
      this.totalMarketValue,
      this.formattedTotalInvestment,
      this.formattedTotalMarketValue,
      this.totalUnits,
      this.irr});

  Fund.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nav = json['nav'];
    formattedNav = json['formattedNav'];
    imgPrefix = json['imgPrefix'];
    category = json['category'];
    subCategory = json['subCategory'];
    navChange = json['navChange'];
    navChangePerc = json['navChangePerc'];
    date = json['date'];
    minRedemptionAmount = json['minRedemptionAmount'];
    totalInvestment = json['totalInvestment'];
    totalMarketValue = json['totalMarketValue'];
    formattedTotalInvestment = json['formattedTotalInvestment'];
    formattedTotalMarketValue = json['formattedTotalMarketValue'];
    totalUnits = json['totalUnits'];
    irr = json['irr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nav'] = this.nav;
    data['formattedNav'] = this.formattedNav;
    data['imgPrefix'] = this.imgPrefix;
    data['category'] = this.category;
    data['subCategory'] = this.subCategory;
    data['navChange'] = this.navChange;
    data['navChangePerc'] = this.navChangePerc;
    data['date'] = this.date;
    data['minRedemptionAmount'] = this.minRedemptionAmount;
    data['totalInvestment'] = this.totalInvestment;
    data['totalMarketValue'] = this.totalMarketValue;
    data['formattedTotalInvestment'] = this.formattedTotalInvestment;
    data['formattedTotalMarketValue'] = this.formattedTotalMarketValue;
    data['totalUnits'] = this.totalUnits;
    data['irr'] = this.irr;
    return data;
  }
}

class Transactions {
  int? insid;
  int? id;
  String? isin;
  String? dATE;
  String? createdDate;
  String? folioNumber;
  String? transactionType;
  String? frequencyType;
  int? sipDate;
  int? amount;
  double? nav;
  double? units;
  String? orderStatus;
  String? remark;
  int? fsmId;
  String? sipStatus;
  int? goalId;
  String? goalName;
  String? fundName;
  String? broadCat;
  String? displayCatName;
  double? latestNav;
  double? navChange;
  double? navChangePercentage;
  String? navDate;
  int? minRedemptionAmnt;
  double? currentValue;
  String? formattedCurrentValue;
  String? formattedAmount;
  String? investmentType;

  Transactions(
      {this.insid,
      this.id,
      this.isin,
      this.dATE,
      this.createdDate,
      this.folioNumber,
      this.transactionType,
      this.frequencyType,
      this.sipDate,
      this.amount,
      this.nav,
      this.units,
      this.orderStatus,
      this.remark,
      this.fsmId,
      this.sipStatus,
      this.goalId,
      this.goalName,
      this.fundName,
      this.broadCat,
      this.displayCatName,
      this.latestNav,
      this.navChange,
      this.navChangePercentage,
      this.navDate,
      this.minRedemptionAmnt,
      this.currentValue,
      this.formattedCurrentValue,
      this.formattedAmount,
      this.investmentType});

  Transactions.fromJson(Map<String, dynamic> json) {
    insid = json['insid'];
    id = json['id'];
    isin = json['isin'];
    dATE = json['DATE'];
    createdDate = json['createdDate'];
    folioNumber = json['folioNumber'];
    transactionType = json['TransactionType'];
    frequencyType = json['frequencyType'];
    sipDate = json['sipDate'];
    amount = json['amount'];
    nav = json['nav'];
    units = json['units'];
    orderStatus = json['orderStatus'];
    remark = json['remark'];
    fsmId = json['fsmId'];
    sipStatus = json['sipStatus'];
    goalId = json['goalId'];
    goalName = json['goalName'];
    fundName = json['fundName'];
    broadCat = json['broadCat'];
    displayCatName = json['displayCatName'];
    latestNav = json['latestNav'];
    navChange = json['navChange'];
    navChangePercentage = json['navChangePercentage'];
    navDate = json['navDate'];
    minRedemptionAmnt = json['minRedemptionAmnt'];
    currentValue = json['currentValue'];
    formattedCurrentValue = json['formattedCurrentValue'];
    formattedAmount = json['formattedAmount'];
    investmentType = json['investmentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insid'] = this.insid;
    data['id'] = this.id;
    data['isin'] = this.isin;
    data['DATE'] = this.dATE;
    data['createdDate'] = this.createdDate;
    data['folioNumber'] = this.folioNumber;
    data['TransactionType'] = this.transactionType;
    data['frequencyType'] = this.frequencyType;
    data['sipDate'] = this.sipDate;
    data['amount'] = this.amount;
    data['nav'] = this.nav;
    data['units'] = this.units;
    data['orderStatus'] = this.orderStatus;
    data['remark'] = this.remark;
    data['fsmId'] = this.fsmId;
    data['sipStatus'] = this.sipStatus;
    data['goalId'] = this.goalId;
    data['goalName'] = this.goalName;
    data['fundName'] = this.fundName;
    data['broadCat'] = this.broadCat;
    data['displayCatName'] = this.displayCatName;
    data['latestNav'] = this.latestNav;
    data['navChange'] = this.navChange;
    data['navChangePercentage'] = this.navChangePercentage;
    data['navDate'] = this.navDate;
    data['minRedemptionAmnt'] = this.minRedemptionAmnt;
    data['currentValue'] = this.currentValue;
    data['formattedCurrentValue'] = this.formattedCurrentValue;
    data['formattedAmount'] = this.formattedAmount;
    data['investmentType'] = this.investmentType;
    return data;
  }
}

class Summary {
  int? totalInvestment;
  double? totalMarketValue;
  String? formattedTotalInvestment;
  String? formattedTotalMarketValue;

  Summary(
      {this.totalInvestment,
      this.totalMarketValue,
      this.formattedTotalInvestment,
      this.formattedTotalMarketValue});

  Summary.fromJson(Map<String, dynamic> json) {
    totalInvestment = json['totalInvestment'];
    totalMarketValue = json['totalMarketValue'];
    formattedTotalInvestment = json['formattedTotalInvestment'];
    formattedTotalMarketValue = json['formattedTotalMarketValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalInvestment'] = this.totalInvestment;
    data['totalMarketValue'] = this.totalMarketValue;
    data['formattedTotalInvestment'] = this.formattedTotalInvestment;
    data['formattedTotalMarketValue'] = this.formattedTotalMarketValue;
    return data;
  }
}

class Redemption {
  double? currentValue;
  double? totalUnits;
  double? availableAmount;
  double? availableUnits;
  int? sipDate;
  int? fsmId;
  int? fundId;
  String? investmentType;
  int? installmentAmount;
  bool? sipCancelled;
  List<GoalBinded>? goalBinded;
  String? formattedAvailableAmount;
  String? formattedCurrentValue;
  String? formattedInstallmentAmount;

  Redemption(
      {this.currentValue,
      this.totalUnits,
      this.availableAmount,
      this.availableUnits,
      this.sipDate,
      this.fsmId,
      this.fundId,
      this.investmentType,
      this.installmentAmount,
      this.sipCancelled,
      this.goalBinded,
      this.formattedAvailableAmount,
      this.formattedCurrentValue,
      this.formattedInstallmentAmount});

  Redemption.fromJson(Map<String, dynamic> json) {
    currentValue = json['currentValue'];
    totalUnits = json['totalUnits'];
    availableAmount = json['availableAmount'];
    availableUnits = json['availableUnits'];
    sipDate = json['sipDate'];
    fsmId = json['fsmId'];
    fundId = json['fundId'];
    investmentType = json['investmentType'];
    installmentAmount = json['installmentAmount'];
    sipCancelled = json['sipCancelled'];
    if (json['goalBinded'] != null) {
      goalBinded = <GoalBinded>[];
      json['goalBinded'].forEach((v) {
        goalBinded!.add(new GoalBinded.fromJson(v));
      });
    }
    formattedAvailableAmount = json['formatted_availableAmount'];
    formattedCurrentValue = json['formatted_currentValue'];
    formattedInstallmentAmount = json['formatted_installmentAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentValue'] = this.currentValue;
    data['totalUnits'] = this.totalUnits;
    data['availableAmount'] = this.availableAmount;
    data['availableUnits'] = this.availableUnits;
    data['sipDate'] = this.sipDate;
    data['fsmId'] = this.fsmId;
    data['fundId'] = this.fundId;
    data['investmentType'] = this.investmentType;
    data['installmentAmount'] = this.installmentAmount;
    data['sipCancelled'] = this.sipCancelled;
    if (this.goalBinded != null) {
      data['goalBinded'] = this.goalBinded!.map((v) => v.toJson()).toList();
    }
    data['formatted_availableAmount'] = this.formattedAvailableAmount;
    data['formatted_currentValue'] = this.formattedCurrentValue;
    data['formatted_installmentAmount'] = this.formattedInstallmentAmount;
    return data;
  }
}

class GoalBinded {
  double? currentValue;
  double? units;
  int? singleAmount;
  int? goalAmount;
  int? goalId;
  Null? goalName;
  String? goalType;
  int? sipPercentage;
  int? userGoalId;
  int? redeemedUnits;
  int? redeemedAmount;
  double? availableUnits;
  double? availableAmount;
  int? yearsForGoal;
  String? formattedAvailableAmount;
  String? formattedCurrentValue;
  String? formattedGoalAmount;
  String? formattedRedeemedAmount;
  String? formattedSingleAmount;

  GoalBinded(
      {this.currentValue,
      this.units,
      this.singleAmount,
      this.goalAmount,
      this.goalId,
      this.goalName,
      this.goalType,
      this.sipPercentage,
      this.userGoalId,
      this.redeemedUnits,
      this.redeemedAmount,
      this.availableUnits,
      this.availableAmount,
      this.yearsForGoal,
      this.formattedAvailableAmount,
      this.formattedCurrentValue,
      this.formattedGoalAmount,
      this.formattedRedeemedAmount,
      this.formattedSingleAmount});

  GoalBinded.fromJson(Map<String, dynamic> json) {
    currentValue = json['currentValue'];
    units = json['units'];
    singleAmount = json['singleAmount'];
    goalAmount = json['goalAmount'];
    goalId = json['goalId'];
    goalName = json['goalName'];
    goalType = json['goalType'];
    sipPercentage = json['sipPercentage'];
    userGoalId = json['userGoalId'];
    redeemedUnits = json['redeemedUnits'];
    redeemedAmount = json['redeemedAmount'];
    availableUnits = json['availableUnits'];
    availableAmount = json['availableAmount'];
    yearsForGoal = json['yearsForGoal'];
    formattedAvailableAmount = json['formatted_availableAmount'];
    formattedCurrentValue = json['formatted_currentValue'];
    formattedGoalAmount = json['formatted_goalAmount'];
    formattedRedeemedAmount = json['formatted_redeemedAmount'];
    formattedSingleAmount = json['formatted_singleAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentValue'] = this.currentValue;
    data['units'] = this.units;
    data['singleAmount'] = this.singleAmount;
    data['goalAmount'] = this.goalAmount;
    data['goalId'] = this.goalId;
    data['goalName'] = this.goalName;
    data['goalType'] = this.goalType;
    data['sipPercentage'] = this.sipPercentage;
    data['userGoalId'] = this.userGoalId;
    data['redeemedUnits'] = this.redeemedUnits;
    data['redeemedAmount'] = this.redeemedAmount;
    data['availableUnits'] = this.availableUnits;
    data['availableAmount'] = this.availableAmount;
    data['yearsForGoal'] = this.yearsForGoal;
    data['formatted_availableAmount'] = this.formattedAvailableAmount;
    data['formatted_currentValue'] = this.formattedCurrentValue;
    data['formatted_goalAmount'] = this.formattedGoalAmount;
    data['formatted_redeemedAmount'] = this.formattedRedeemedAmount;
    data['formatted_singleAmount'] = this.formattedSingleAmount;
    return data;
  }
}
