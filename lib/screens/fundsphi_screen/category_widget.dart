import 'dart:core';

import 'package:flutter/material.dart';
import 'package:moneyphi/screens/fundsphi_screen/fundsphi_screen.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../controller/MutualFundsController.dart';

int i = 0;
int scrollIndex = 0;

class CategoryWidget extends StatefulWidget {
  dynamic index;
  String? name;
  String? subcat;
  double? verticleMargin;
  ItemScrollController? scrollController;
  CategoryWidget(
      {this.index,
      this.name,
      this.verticleMargin,
      this.subcat,
      this.scrollController,
      Key? key})
      : super(key: key);
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  MutualFundsController? mutualFundsController;

  @override
  void initState() {
    mutualFundsController =
        Provider.of<MutualFundsController>(context, listen: false);
    if (widget.index == 0 && i == 0) {
      i = i + 1;
      Future.delayed(Duration(milliseconds: 100), () {
        widget.scrollController!
            .scrollTo(index: scrollIndex, duration: Duration(seconds: 1));

        setState(() {});
      });
    }
    print("dmkf$i");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MutualFundsController>(
        builder: (context, controller, child) {
      return GestureDetector(
        onTap: () {
          onpress(widget.index, widget.scrollController);
          setState(() {
            widget.subcat = "";
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(
              horizontal: 5, vertical: widget.verticleMargin ?? 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: controller.subcats == widget.name
                  ? Colors.green
                  : Colors.white,
              border: Border.all(color: Colors.green)),
          child: Center(
            child: Text(
              widget.name!,
              style: TextStyle(
                  color: controller.subcats == widget.name
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ),
      );
    });
  }

  void onpress(index, controlle) {
    setState(() {
      i = 0;
      mutualFundsController!
          .getsearchfunds(context, mutualFundsController!.cats, widget.name);
      widget.subcat = widget.name;
      print("widget.index");
      print(widget.index);
      scrollIndex = widget.index;
    });
  }
}

class SubCategoryWidget extends StatefulWidget {
  dynamic index;
  String? name;
  String? subcat;
  double? verticleMargin;
  SubCategoryWidget({this.index, this.name, this.verticleMargin, this.subcat});
  @override
  State<SubCategoryWidget> createState() => _SubCategoryWidgetState();
}

class _SubCategoryWidgetState extends State<SubCategoryWidget> {
  MutualFundsController? mutualFundsController;
  @override
  void initState() {
    mutualFundsController =
        Provider.of<MutualFundsController>(context, listen: false);

    super.initState();
  }

  int? _selectIndex;
  @override
  Widget build(BuildContext context) {
    return Consumer<MutualFundsController>(
        builder: (context, controller, child) {
      return GestureDetector(
        onTap: () {
          onpress(widget.index);
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.symmetric(
              horizontal: 5, vertical: widget.verticleMargin ?? 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  controller.cats == widget.name ? Colors.green : Colors.white,
              border: Border.all(color: Colors.green)),
          child: Center(
            child: Text(
              widget.name!,
              style: TextStyle(
                  color: controller.cats == widget.name
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ),
      );
    });
  }

  void onpress(index) {
    mutualFundsController!.getsearchfunds(
      context,
      widget.name,
      "All",
    );
    setState(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => FundsPhiScreen(
                    category: widget.name!,
                  )));

      //widget.subcat = widget.name;
      print(widget.index);
    });
  }
}
