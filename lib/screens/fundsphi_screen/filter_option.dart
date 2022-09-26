import 'package:flutter/material.dart';
import 'package:moneyphi/utils/SizeConfig.dart';
import 'package:moneyphi/widgets/AppBarWithBackButton.dart';

import 'category_widget.dart';

class FilterOption extends StatefulWidget {
  @override
  State<FilterOption> createState() => _FilterOptionState();
}

class _FilterOptionState extends State<FilterOption> {
  int? _selectIndex;
  var categories = [
    "Equity",
    "Hybrid",
    "Debt",
    "Commodities",
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBarWithBackButton(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Filter Option"),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              Text("Minimum SIP Investment"),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      onpress(1);
                    },
                    child: Container(
                      width: 70,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              _selectIndex == 1 ? Colors.green : Colors.white,
                          border: Border.all(color: Colors.green)),
                      child: Center(
                        child: Text(
                          "100",
                          style: TextStyle(
                              color: _selectIndex == 1
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onpress(2);
                    },
                    child: Container(
                      width: 70,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              _selectIndex == 2 ? Colors.green : Colors.white,
                          border: Border.all(color: Colors.green)),
                      child: Center(
                        child: Text(
                          "500",
                          style: TextStyle(
                              color: _selectIndex == 2
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onpress(3);
                    },
                    child: Container(
                      width: 70,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              _selectIndex == 3 ? Colors.green : Colors.white,
                          border: Border.all(color: Colors.green)),
                      child: Center(
                        child: Text(
                          "1000",
                          style: TextStyle(
                              color: _selectIndex == 3
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
                      onpress(1);
                    },
                    child: Container(
                      width: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              _selectIndex == 1 ? Colors.green : Colors.white,
                          border: Border.all(color: Colors.green)),
                      child: Center(
                        child: Text(
                          "Growth",
                          style: TextStyle(
                              color: _selectIndex == 1
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onpress(2);
                    },
                    child: Container(
                      width: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              _selectIndex == 2 ? Colors.green : Colors.white,
                          border: Border.all(color: Colors.green)),
                      child: Center(
                        child: Text(
                          "IDCW",
                          style: TextStyle(
                              color: _selectIndex == 2
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("Mutual Fund Companies"),
              SizedBox(
                height: 10,
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
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                        name: categories[index], index: index);
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
        ),
      ),
    );
  }

  void onpress(index) {
    setState(() {
      _selectIndex = index;
    });
  }

  getCompanies() {
    List<Widget> category_widget = [];
    for (int i = 0; i < categories.length; i++) {
      category_widget.add(CategoryWidget(name: categories[i], index: i));
    }
    return Wrap(
      children: category_widget,
    );
  }
}
