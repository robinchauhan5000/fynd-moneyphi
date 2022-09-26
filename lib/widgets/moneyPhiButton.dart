import 'package:flutter/material.dart';
import 'package:moneyphi/utils/Colors.dart';
import 'package:moneyphi/utils/SizeConfig.dart';

class MoneyPhiButton extends StatelessWidget {
  String? buttonTitle;
  VoidCallback? onClick;
  double? width;

  MoneyPhiButton({this.buttonTitle, this.onClick, this.width});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 10, right: 50, left: 50),
        height: 50,
        width: width == null ? SizeConfig.screenWidth * 0.7 : width,
        decoration: BoxDecoration(
          color: appColorPrimary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: appColorPrimary.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 8,
            ),
          ],
        ),
        child: Text(
          buttonTitle ?? '',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
