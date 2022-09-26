import 'package:flutter/material.dart';
import 'package:moneyphi/controller/PaymentController.dart';
import 'package:moneyphi/screens/order_status/order_detailed_status.dart';
import 'package:moneyphi/theme/theme.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

import '../../Model/OrderStatusModel.dart';

class OrderList extends StatefulWidget {
  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  PaymentController? paymentController;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () {
      paymentController =
          Provider.of<PaymentController>(context, listen: false);
      paymentController?.getOrderList(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Orders'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Consumer<PaymentController>(builder: (context, controller, child) {
        return controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.orderStatusModel?.orders?.length,
                itemBuilder: (context, index) {
                  return statusCard(
                      controller.orderStatusModel?.orders?[index]);
                });
      }),
    );
  }

  statusCard(Order? order) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderStatus(
                      order: order,
                    )));
      },
      child: Container(
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
                  Text(
                      '${order?.orderTracking?.orderPlaced?.at.toString().substring(0, 12)}'),
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
            ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
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
                                width: 5,
                              ),
                              Column(
                                children: [
                                  Container(
                                    child: Text(
                                        '${order?.funds?[index].fundName}'),
                                    width: SizeConfig.screenWidth * 0.6,
                                  ),
                                  Text('Equity | Large cap'),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ],
                          ),
                          Text(
                            '${rupeeSymbol}${order?.funds?[index].amount.toString()}',
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
                            'Investment',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
