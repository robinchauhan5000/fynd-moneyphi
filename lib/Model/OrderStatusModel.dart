import 'dart:convert';

OrderStatusModel orderStatusModelFromJson(String str) =>
    OrderStatusModel.fromJson(json.decode(str));

String orderStatusModelToJson(OrderStatusModel data) =>
    json.encode(data.toJson());

class OrderStatusModel {
  OrderStatusModel({
    this.success,
    this.orders,
  });

  bool? success;
  List<Order>? orders;

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      OrderStatusModel(
        success: json["success"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.igmId,
    this.orderTracking,
    this.goalData,
    this.funds,
    this.expandable,
  });

  int? igmId;
  OrderTracking? orderTracking;
  GoalData? goalData;
  List<Fund>? funds;
  bool? expandable;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        igmId: json["igmId"],
        orderTracking: OrderTracking.fromJson(json["order_tracking"]),
        goalData: GoalData.fromJson(json["goalData"]),
        funds: List<Fund>.from(json["funds"].map((x) => Fund.fromJson(x))),
        expandable: json["expandable"],
      );

  Map<String, dynamic> toJson() => {
        "igmId": igmId,
        "order_tracking": orderTracking?.toJson(),
        "goalData": goalData?.toJson(),
        "funds": List<dynamic>.from(funds!.map((x) => x.toJson())),
        "expandable": expandable,
      };
}

class Fund {
  Fund({
    this.fundId,
    this.fundName,
    this.displayCatName,
    this.broadCat,
    this.riskLevel,
    this.orderNumber,
    this.bseFolioNumber,
    this.isin,
    this.buySell,
    this.amount,
    this.nav,
    this.status,
    this.remark,
    this.fsmId,
    this.orderType,
    this.sipRegnNumber,
    this.firstOrderToday,
    this.createdDate,
    this.updatedDate,
    this.date,
    this.time,
  });

  int? fundId;
  String? fundName;
  String? displayCatName;
  String? broadCat;
  String? riskLevel;
  String? orderNumber;
  String? bseFolioNumber;
  String? isin;
  String? buySell;
  int? amount;
  String? nav;
  String? status;
  String? remark;
  int? fsmId;
  String? orderType;
  String? sipRegnNumber;
  String? firstOrderToday;
  DateTime? createdDate;
  DateTime? updatedDate;
  String? date;
  String? time;

  factory Fund.fromJson(Map<String, dynamic> json) => Fund(
        fundId: json["fundId"],
        fundName: json["fundName"],
        displayCatName: json["displayCatName"],
        broadCat: json["broadCat"],
        riskLevel: json["riskLevel"],
        orderNumber: json["orderNumber"],
        bseFolioNumber: json["bseFolioNumber"],
        isin: json["isin"],
        buySell: json["buySell"],
        amount: json["amount"],
        nav: json["nav"],
        status: json["status"],
        remark: json["remark"],
        fsmId: json["fsmId"],
        orderType: json["orderType"],
        sipRegnNumber: json["sipRegnNumber"],
        firstOrderToday: json["firstOrderToday"],
        createdDate: DateTime.parse(json["createdDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "fundId": fundId,
        "fundName": fundName,
        "displayCatName": displayCatName,
        "broadCat": broadCat,
        "riskLevel": riskLevel,
        "orderNumber": orderNumber,
        "bseFolioNumber": bseFolioNumber,
        "isin": isin,
        "buySell": buySell,
        "amount": amount,
        "nav": nav,
        "status": status,
        "remark": remark,
        "fsmId": fsmId,
        "orderType": orderType,
        "sipRegnNumber": sipRegnNumber,
        "firstOrderToday": firstOrderToday,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
        "date": date,
        "time": time,
      };
}

class GoalData {
  GoalData({
    this.userGoalId,
    this.goalId,
    this.goalName,
    this.subGoalName,
    this.goalAmount,
    this.orderType,
    this.totalAmount,
    this.date,
    this.time,
  });

  int? userGoalId;
  int? goalId;
  String? goalName;
  String? subGoalName;
  int? goalAmount;
  String? orderType;
  int? totalAmount;
  String? date;
  String? time;

  factory GoalData.fromJson(Map<String, dynamic> json) => GoalData(
        userGoalId: json["userGoalId"],
        goalId: json["goalId"],
        goalName: json["goalName"],
        subGoalName: json["subGoalName"],
        goalAmount: json["goalAmount"],
        orderType: json["orderType"],
        totalAmount: json["totalAmount"],
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "userGoalId": userGoalId,
        "goalId": goalId,
        "goalName": goalName,
        "subGoalName": subGoalName,
        "goalAmount": goalAmount,
        "orderType": orderType,
        "totalAmount": totalAmount,
        "date": date,
        "time": time,
      };
}

class OrderTracking {
  OrderTracking({
    this.orderPlaced,
    this.sipOrderPlaced,
    this.payment,
    this.unitAllocation,
  });

  OrderPlaced? orderPlaced;
  OrderPlaced? sipOrderPlaced;
  OrderPlaced? payment;
  OrderPlaced? unitAllocation;

  factory OrderTracking.fromJson(Map<String, dynamic> json) => OrderTracking(
        orderPlaced: OrderPlaced.fromJson(json["orderPlaced"]),
        sipOrderPlaced: OrderPlaced.fromJson(json["sipOrderPlaced"]),
        payment: OrderPlaced.fromJson(json["payment"]),
        unitAllocation: OrderPlaced.fromJson(json["unitAllocation"]),
      );

  Map<String, dynamic> toJson() => {
        "orderPlaced": orderPlaced?.toJson(),
        "sipOrderPlaced": sipOrderPlaced?.toJson(),
        "payment": payment?.toJson(),
        "unitAllocation": unitAllocation?.toJson(),
      };
}

class OrderPlaced {
  OrderPlaced({
    this.headerText,
    this.secondaryText,
    this.status,
    this.at,
    this.expectedDate,
  });

  String? headerText;
  String? secondaryText;
  String? status;
  String? at;
  String? expectedDate;

  factory OrderPlaced.fromJson(Map<String, dynamic> json) => OrderPlaced(
        headerText: json["headerText"],
        secondaryText: json["secondaryText"],
        status: json["status"],
        at: json["at"],
        expectedDate:
            json["expectedDate"] == null ? null : json["expectedDate"],
      );

  Map<String, dynamic> toJson() => {
        "headerText": headerText,
        "secondaryText": secondaryText,
        "status": status,
        "at": at,
        "expectedDate": expectedDate == null ? null : expectedDate,
      };
}

enum Status { SUCCESS, PENDING }

final statusValues =
    EnumValues({"pending": Status.PENDING, "success": Status.SUCCESS});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
