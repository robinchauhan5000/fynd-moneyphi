import 'package:flutter/material.dart';
import 'package:moneyphi/utils/Colors.dart';

class PaymentSucessfulSceen extends StatefulWidget {
  const PaymentSucessfulSceen({Key? key}) : super(key: key);

  @override
  State<PaymentSucessfulSceen> createState() => _PaymentSucessfulSceenState();
}

class _PaymentSucessfulSceenState extends State<PaymentSucessfulSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Payment Done"),
          )
        ],
      ),
    );
  }

  showDialogBox(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Welcome'),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Cancel'))
                ],
              ),
              const Text("Hi investor, it seems you havent \n"
                  "completed your KYC/Onboarding."),
              SizedBox(height: 25),
              const Text("As per SEBI Norms all investors have \n"
                  "to complete KYC process to invest in \n mutual funds."),
              SizedBox(height: 25),
              Container(
                  height: size.height * 0.05,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PanCardFormScreen()));
                    },
                    child: const Center(
                      child: Text(
                        'Complete Onboarding',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
            ],
          ),
          actions: [
            // FlatButton(
            //   textColor: Colors.black,
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   child: const Text('CANCEL'),
            // ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'ACCEPT',
                style: TextStyle(color: appColorPrimary),
              ),
            ),
          ],
        );
      },
    );
  }
}
