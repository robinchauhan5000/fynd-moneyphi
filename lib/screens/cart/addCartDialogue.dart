// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:moneyphi/controller/MutualFundsController.dart';
// import 'package:moneyphi/controller/dashBoardController.dart';
// import 'package:provider/provider.dart';
//
// import '../../Model/MutualFundModel.dart';
//
// class AddCartDialog extends StatefulWidget {
//   final Fund? model;
//   const AddCartDialog({this.model});
//
//   @override
//   State<AddCartDialog> createState() => _AddCartDialogState();
// }
//
// class _AddCartDialogState extends State<AddCartDialog> {
//   bool switchValue = false;
//   bool untillInstallment = false;
//   int minimumInstallment = 12;
//   TextEditingController sipController = TextEditingController();
//   TextEditingController oneTimeController = TextEditingController();
//   DashBoardController? dashboardController;
//   MutualFundsController? mutualFundsController;
//
//   @override
//   void initState() {
//     mutualFundsController =
//         Provider.of<MutualFundsController>(context, listen: false);
//     dashboardController =
//         Provider.of<DashBoardController>(context, listen: false);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       insetPadding: EdgeInsets.zero,
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: Icon(Icons.close)),
//           Divider(
//             height: 1,
//             color: Colors.grey,
//             thickness: 1,
//           )
//         ],
//       ),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'SIP',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Switch(
//                     value: switchValue,
//                     inactiveTrackColor: Colors.blueAccent,
//                     activeColor: Theme.of(context).primaryColor,
//                     overlayColor: MaterialStateProperty.all(
//                         Theme.of(context).primaryColor),
//                     onChanged: (change) => {
//                           print("switchValue"),
//                           print(switchValue),
//                           setState(() => {switchValue = change})
//                         }),
//                 Text(
//                   'One Time',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             switchValue ? oneTime() : sipOptionShow(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   sipOptionShow() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Container(
//           width: 200,
//           child: TextFormField(
//             controller: sipController,
//             textAlign: TextAlign.center,
//           ),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         Text('Minimum SIP 500'),
//         SizedBox(
//           height: 5,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Installment'),
//             Checkbox(
//                 value: untillInstallment,
//                 onChanged: (value) => {
//                       setState(() => {
//                             untillInstallment = !untillInstallment,
//                             if (untillInstallment)
//                               {minimumInstallment = 60}
//                             else
//                               {minimumInstallment = 12}
//                           })
//                     }),
//             Text('untill cancelled'),
//           ],
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all(Color(0xffDBDFE3))),
//                 onPressed: untillInstallment
//                     ? null
//                     : () {
//                         setState(() {
//                           if (minimumInstallment > 5) {
//                             minimumInstallment = minimumInstallment - 1;
//                           }
//                         });
//                       },
//                 child: Icon(
//                   Icons.remove,
//                   color: Colors.grey,
//                 )),
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Color(0xffDBDFE3)),
//               child: Text('$minimumInstallment'),
//             ),
//             ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all(Color(0xffDBDFE3))),
//                 onPressed: untillInstallment
//                     ? null
//                     : () {
//                         setState(() {
//                           minimumInstallment = minimumInstallment + 1;
//                         });
//                       },
//                 child: Icon(
//                   Icons.add,
//                   color: Colors.grey,
//                 )),
//           ],
//         ),
//         Text('minimum installment.6'),
//         SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Consumer<MutualFundsController>(
//                 builder: (context, controller, child) {
//               return OutlinedButton(
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(width: 1.0, color: Colors.blue),
//                   ),
//                   onPressed: () async {
//                     var value = await mutualFundsController?.addToCart(
//                         context: context,
//                         fundId: widget.model?.fundId,
//                         amount: sipController.text,
//                         investmentType: "sip",
//                         totalInstallments: minimumInstallment);
//                     if (value == true) {
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: controller.isLoading
//                       ? CircularProgressIndicator()
//                       : Text(
//                           'Add Cart',
//                           style: TextStyle(color: Colors.black),
//                         ));
//             }),
//             OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   side: BorderSide(width: 1.0, color: Colors.blue),
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   'Invest Now',
//                   style: TextStyle(color: Colors.black),
//                 )),
//           ],
//         )
//       ],
//     );
//   }
//
//   oneTime() {
//     return Column(
//       children: [
//         Container(
//           width: 200,
//           child: TextFormField(
//             controller: oneTimeController,
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text('Minimum SIP 5000'),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Consumer<MutualFundsController>(
//                 builder: (context, controller, child) {
//               return OutlinedButton(
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(width: 1.0, color: Colors.blue),
//                   ),
//                   onPressed: () async {
//                     print('dddddd');
//                     var value = await mutualFundsController?.addToCart(
//                         context: context,
//                         fundId: widget.model?.fundId,
//                         amount: oneTimeController.text,
//                         investmentType: "",
//                         totalInstallments: minimumInstallment);
//                     if (value == true) {
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: controller.isLoading
//                       ? CircularProgressIndicator()
//                       : Text(
//                           'Add Cart',
//                           style: TextStyle(color: Colors.black),
//                         ));
//             }),
//             OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   side: BorderSide(width: 1.0, color: Colors.blue),
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   'Invest Now',
//                   style: TextStyle(color: Colors.black),
//                 )),
//           ],
//         )
//       ],
//     );
//   }
// }
