import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/theme/theme.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';

import '../../Model/OrderStatusModel.dart';

class OrderStatus extends StatefulWidget {
  Order? order;
  OrderStatus({this.order});
  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
        children: [
          statusCard(),
          statusTrack(),
        ],
      ),
    );
  }

  void _showSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                height: SizeConfig.screenHeight * 0.7,
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: widget.order?.funds?.length,
                    itemBuilder: (context, index) {
                      return statusCard();
                    }));
          });
        });
  }

  statusCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          boxShadow: [mainboxshadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.order!.funds![0].date!),
                Text(
                  'Order Status',
                  style: TextStyle(
                    color: Color(0xffEF9918),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/pieChart.png',
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: SizeConfig.screenWidth * 0.5,
                          child: Text(widget.order?.funds?[0].fundName ?? "")),
                      Text(
                        '${widget.order!.funds![0].broadCat} | ${widget.order!.funds![0].displayCatName}',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '${rupeeSymbol + widget.order!.funds![0].amount!.toString() ?? ""}',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.order?.funds?[0].orderType ?? "",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }

  statusTrack() {
    return Container(
        height: SizeConfig.screenHeight * 0.5,
        decoration: BoxDecoration(
            boxShadow: [mainboxshadow],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: widget
                                .order?.orderTracking?.sipOrderPlaced?.status
                                .toString() ==
                            "pending"
                        ? Colors.orangeAccent
                        : appColorPrimary,
                  ),
                  Container(
                    height: SizeConfig.screenHeight * 0.15,
                    width: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade500,
                    ),
                  ),
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: widget
                                .order?.orderTracking?.payment?.status
                                .toString() ==
                            "pending"
                        ? Colors.orangeAccent
                        : appColorPrimary,
                  ),
                  Container(
                    height: SizeConfig.screenHeight * 0.15,
                    width: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade500,
                    ),
                  ),
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: widget
                                .order?.orderTracking?.unitAllocation?.status
                                .toString() ==
                            "pending"
                        ? Colors.orangeAccent
                        : appColorPrimary,
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: SizeConfig.screenHeight * 0.15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${widget.order?.orderTracking?.sipOrderPlaced?.headerText}"),
                        Text(
                            "${widget.order?.orderTracking?.sipOrderPlaced?.secondaryText}"),
                        Text("Order id:${widget.order?.igmId}"),
                      ],
                    ),
                  ),
                  Container(
                    height: SizeConfig.screenHeight * 0.15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.02,
                        ),
                        Text(
                            "${widget.order?.orderTracking?.payment?.headerText}"),
                        Text(
                            "${widget.order?.orderTracking?.payment?.secondaryText}"),
                        Text(
                            "Order id:${widget.order?.orderTracking?.payment?.at}"),
                      ],
                    ),
                  ),
                  Container(
                    height: SizeConfig.screenHeight * 0.15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.screenHeight * 0.04,
                        ),
                        Container(
                          width: SizeConfig.screenWidth * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${widget.order?.orderTracking?.unitAllocation?.headerText}"),
                              TextButton(
                                  onPressed: () {
                                    _showSheet(context);
                                  },
                                  child: Text("View Funds"))
                            ],
                          ),
                        ),
                        Text(
                            "${widget.order?.orderTracking?.unitAllocation?.secondaryText}"),
                        Text(
                            "Order id:${widget.order?.orderTracking?.unitAllocation?.at}"),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
