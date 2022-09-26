import 'package:flutter/material.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../controller/MutualFundsController.dart';
import '../../widgets/AppBarWithBackButton.dart';
import 'category_widget.dart';
import 'filter_option.dart';
import 'fundship_tile.dart';

class FundsPhiScreen extends StatefulWidget {
  String category;
  String? subCat;
  FundsPhiScreen({required this.category, this.subCat});
  @override
  State<FundsPhiScreen> createState() => _FundsPhiScreenState();
}

class _FundsPhiScreenState extends State<FundsPhiScreen> {
  var typeOfFunds = [
    "Equity",
    "Hybrid",
    "Debt",
    "Commodities",
  ];

  var subTypeOfFunds = [
    "All Funds",
    "Large Cap",
    "Mid Cap",
  ];
  final itemKey = GlobalKey();
  final scrollController = ScrollController();
  List<bool> minSIP = [false, false, false, false];
  List<bool> investMentOption = [false, false, false];
  MutualFundsController? mutualFundsController;
  ItemScrollController _scrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  @override
  void initState() {
    mutualFundsController =
        Provider.of<MutualFundsController>(context, listen: false);
    Future.delayed(Duration(milliseconds: 100), () {
      mutualFundsController!.getCatFunds(context);
    });

    super.initState();
  }

  scrollToPosition() {}

  void _showSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text(
                  "Filter Option",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Text("Minimum SIP Investment"),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(minSIP[0]);
                        setState(() {
                          minSIP[0] = !minSIP[0];
                        });
                      },
                      child: Container(
                        width: 70,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                minSIP[0] == true ? Colors.green : Colors.white,
                            border: Border.all(color: Colors.green)),
                        child: Center(
                          child: Text(
                            "100",
                            style: TextStyle(
                                color: minSIP[0] == true
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          minSIP[1] = !minSIP[1];
                        });
                      },
                      child: Container(
                        width: 70,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                minSIP[1] == true ? Colors.green : Colors.white,
                            border: Border.all(color: Colors.green)),
                        child: Center(
                          child: Text(
                            "500",
                            style: TextStyle(
                                color: minSIP[1] == true
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          minSIP[2] = !minSIP[2];
                        });
                      },
                      child: Container(
                        width: 70,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                minSIP[2] == true ? Colors.green : Colors.white,
                            border: Border.all(color: Colors.green)),
                        child: Center(
                          child: Text(
                            "1000",
                            style: TextStyle(
                                color: minSIP[2] == true
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                Text("Investment Option"),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          investMentOption[0] = true;
                          investMentOption[1] = false;
                        });
                      },
                      child: Container(
                        width: 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: investMentOption[0] == true
                                ? Colors.green
                                : Colors.white,
                            border: Border.all(color: Colors.green)),
                        child: Center(
                          child: Text(
                            "Growth",
                            style: TextStyle(
                                color: investMentOption[0] == true
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          investMentOption[0] = false;
                          investMentOption[1] = true;
                        });
                      },
                      child: Container(
                        width: 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        margin:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: investMentOption[0] == true
                                ? Colors.green
                                : Colors.white,
                            border: Border.all(color: Colors.green)),
                        child: Center(
                          child: Text(
                            "IDCW",
                            style: TextStyle(
                                color: investMentOption[0] == true
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                Text("Mutual Fund Companies"),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                Consumer<MutualFundsController>(
                    builder: (context, controller, child) {
                  return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2 / 0.9,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: typeOfFunds.length,
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                            name: typeOfFunds[index], index: index);
                      });
                }),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.1,
                ),
                Center(
                  child: Text(
                    "View More",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }

  showBottomSheetWithFilters() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return DraggableScrollableSheet(
            //set this as you want
            expand: true,
            builder: (context, scrollController) {
              return Expanded(
                child: ListView(
                  children: [
                    Text("Filter Option"),
                    // SizedBox(
                    //   height: SizeConfig.screenHeight * 0.05,
                    // ),
                    Text("Minimum SIP Investment"),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              minSIP[0] = true;
                              minSIP[1] = false;
                              minSIP[2] = false;
                            });
                          },
                          child: Container(
                            width: 70,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: minSIP[0] == true
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.green)),
                            child: Center(
                              child: Text(
                                "100",
                                style: TextStyle(
                                    color: minSIP[0] == true
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              minSIP[0] = false;
                              minSIP[1] = true;
                              minSIP[2] = false;
                            });
                          },
                          child: Container(
                            width: 70,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: minSIP[1] == true
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.green)),
                            child: Center(
                              child: Text(
                                "500",
                                style: TextStyle(
                                    color: minSIP[1] == true
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              minSIP[0] = false;
                              minSIP[1] = false;
                              minSIP[2] = true;
                            });
                          },
                          child: Container(
                            width: 70,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: minSIP[2] == true
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.green)),
                            child: Center(
                              child: Text(
                                "1000",
                                style: TextStyle(
                                    color: minSIP[2] == true
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    Text("Investment Option"),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              investMentOption[0] = true;
                              investMentOption[1] = false;
                            });
                          },
                          child: Container(
                            width: 100,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: investMentOption[0] == true
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.green)),
                            child: Center(
                              child: Text(
                                "Growth",
                                style: TextStyle(
                                    color: investMentOption[0] == true
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              investMentOption[0] = false;
                              investMentOption[1] = true;
                            });
                          },
                          child: Container(
                            width: 100,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: investMentOption[0] == true
                                    ? Colors.green
                                    : Colors.white,
                                border: Border.all(color: Colors.green)),
                            child: Center(
                              child: Text(
                                "IDCW",
                                style: TextStyle(
                                    color: investMentOption[0] == true
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    Text("Mutual Fund Companies"),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                    ),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2 / 0.9,
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: typeOfFunds.length,
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                              name: typeOfFunds[index], index: index);
                        }),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.1,
                    ),
                    Center(
                      child: Text(
                        "View More",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWithBackButton(),
      body: SafeArea(
        child: Consumer<MutualFundsController>(
          builder: (context, controller, child) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: TextField(
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: new BorderSide(
                              color: Theme.of(context).primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: new BorderSide(
                              color: Theme.of(context).primaryColor)),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onChanged: (value) {
                      mutualFundsController!.getsearchfunds(
                          context, widget.category, widget.subCat,
                          text: value);
                    },
                  ),
                ),
                Container(
                  height: 60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: typeOfFunds.length,
                      itemBuilder: (context, index) {
                        return SubCategoryWidget(
                          name: typeOfFunds[index],
                          index: index,
                          subcat: widget.subCat,
                          verticleMargin: 8,
                        );
                      }),
                ),
                controller.isLoading
                    ? CircularProgressIndicator()
                    : Container(
                        height: 60,
                        child: ScrollablePositionedList.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: widget.category == "Hybrid"
                                ? controller
                                    .mutualFundCategoryModel!.hybrid.length
                                : widget.category == "Equity"
                                    ? controller
                                        .mutualFundCategoryModel!.equity.length
                                    : widget.category == "Commodities"
                                        ? controller.mutualFundCategoryModel!
                                            .commodities.length
                                        : controller.mutualFundCategoryModel!
                                            .debt.length,
                            itemScrollController: _scrollController,
                            itemPositionsListener: itemPositionsListener,
                            reverse: false,
                            addAutomaticKeepAlives: false,
                            itemBuilder: (context, index) {
                              return CategoryWidget(
                                scrollController: _scrollController,
                                subcat: widget.subCat,
                                name: widget.category == "Hybrid"
                                    ? controller
                                        .mutualFundCategoryModel?.hybrid[index]
                                    : widget.category == "Equity"
                                        ? controller.mutualFundCategoryModel
                                            ?.equity[index]
                                        : widget.category == "Commodities"
                                            ? controller.mutualFundCategoryModel
                                                ?.commodities[index]
                                            : controller.mutualFundCategoryModel
                                                ?.debt[index],
                                index: index,
                                verticleMargin: 8,
                              );
                            })),
                Expanded(
                    child: controller.mutualFundModel!.count == 0
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error,
                                  size: 80,
                                  color: Colors.grey.shade400,
                                ),
                                Text(
                                  "No Data Found",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FilterOption(),
                                    ),
                                  );
                                },
                                child: FundShipTile(
                                    model: controller.mutualFundModel!.funds
                                        .elementAt(index),
                                    index: index,
                                    id: controller.mutualFundModel!.funds
                                        .elementAt(index)
                                        .fundId,
                                    fundshipName: controller
                                        .mutualFundModel!.funds
                                        .elementAt(index)
                                        .fundName,
                                    watchlistid: controller
                                        .mutualFundModel!.funds
                                        .elementAt(index)
                                        .watchListId,
                                    minSip: controller.mutualFundModel!.funds
                                        .elementAt(index)
                                        .minSipAmnt
                                        .toString(),
                                    duration: "3 Yrs",
                                    nav: controller.mutualFundModel!.funds
                                        .elementAt(index)
                                        .return3Yr
                                        .toString()),
                              );
                            },
                            itemCount: controller.mutualFundModel!.count,
                          ))
              ],
            );
          },
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        width: SizeConfig.blockSizeHorizontal * 30,
        decoration: BoxDecoration(
            color: Color(0xffC4C4C4), borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterOption(),
                  ),
                );
              },
              child: Icon(
                Icons.heart_broken_rounded,
                color: Colors.redAccent,
                size: 30,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => FilterOption(),
                //   ),
                // );
                _showSheet(context);
              },
              child: Icon(
                Icons.filter_alt_sharp,
                color: Colors.blue,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

// getCategories() {
//   List<Widget> category_widget = [];
//   for (int i = 0; i < categories.length; i++) {
//     category_widget.add(CategoryWidget(name: categories[i], index: i));
//   }
//   return Wrap(
//     children: category_widget,
//   );
// }
}
