import 'package:flutter/material.dart';
import 'package:moneyphi/controller/MutualFundsController.dart';
import 'package:moneyphi/controller/PaymentController.dart';
import 'package:moneyphi/controller/dashBoardController.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SharedPref.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';

class CartDateAlert extends StatefulWidget {
  List<int>? sipDates;
  int? fundshipId;
  int? inputId;

  CartDateAlert({
    this.sipDates,
    this.fundshipId,
    this.inputId,
  });

  @override
  State<CartDateAlert> createState() => _CartDateAlertState();
}

class _CartDateAlertState extends State<CartDateAlert> {
  int? selectIndex;
  PaymentController? mutualFundsController;
  MutualFundsController? mutualController;
  onDateSelect(index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  void initState() {
    mutualFundsController =
        Provider.of<PaymentController>(context, listen: false);
    mutualController =
        Provider.of<MutualFundsController>(context, listen: false);
    getDate();
    super.initState();
  }

  getDate() async {
    selectIndex = int.parse(
            await SharedPref().getString(key: "id${widget.fundshipId}") ??
                "35") -
        1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        title: Column(
          children: [
            Text(
              "Pick a date for SIP",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Divider(
              thickness: 1.5,
              height: 10,
            )
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              SizedBox(
                width: 20,
              ),
              Consumer<DashBoardController>(
                  builder: (context, controller, child) {
                return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                    onPressed: () async {
                      print("id${widget.fundshipId}");
                      SharedPref().setString(
                          key: "id${widget.fundshipId}",
                          value: (selectIndex! + 1).toString());
                      var res = await mutualFundsController!.registerSIPDates(
                          context: context,
                          selectedDate: selectIndex! + 1,
                          inputId: widget.inputId!);

                      print("res");
                      print(res);
                      if (res == true) {
                        Navigator.pop(context);

                        if (mutualController!.sipDateAdded
                            .contains(widget.fundshipId)) {
                          print("ouafjno;adsln${widget.fundshipId}");
                        } else {
                          print("ouafjno;adsln");
                          mutualController!.sipDateAdded.add(widget.fundshipId);
                        }
                      }
                    },
                    child: Text("Save", style: TextStyle(color: Colors.white)));
              }),
            ],
          )
        ],
        content: Container(
          height: SizeConfig.screenHeight / 31 * 16,
          width: 200,
          child: GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: 1.0,
            shrinkWrap: true,
            children: List.generate(
              31,
              (index) => GestureDetector(
                onTap: () {
                  onDateSelect(index);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        index == selectIndex ? appColorPrimary : Colors.white,
                  ),
                  child: Text(
                    "${index + 1}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: index == selectIndex
                            ? Colors.white
                            : widget.sipDates!.contains(index + 1)
                                ? Colors.black
                                : Colors.grey),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
