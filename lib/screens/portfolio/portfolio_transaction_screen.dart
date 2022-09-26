import 'package:flutter/material.dart';
import 'package:moneyphi/screens/portfolio/sip_portfolio_details.dart';

class PortFolioTransactions extends StatefulWidget {
  const PortFolioTransactions({Key? key}) : super(key: key);

  @override
  State<PortFolioTransactions> createState() => _PortFolioTransactionsState();
}

class _PortFolioTransactionsState extends State<PortFolioTransactions> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        backwardsCompatibility: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.033),
                          SizedBox(
                            height: size.height * 0.03,
                            width: size.width * 0.06,
                            //color: Colors.pink,
                            child: Image.asset('images/icici.png',
                                fit: BoxFit.cover),
                          ),
                          SizedBox(width: size.width * 0.05),
                          Text(
                            "ICICI Prudential Emerging Blue Chip",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: size.width * 0.08),
                          PopupMenuButton(
                            onSelected: (value) {
                              if (value == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SIPPortfolioDetails()));
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 0,
                                child: Row(
                                  children: const [
                                    SizedBox(width: 10),
                                    Text(
                                      "View SIPs",
                                      style:
                                          TextStyle(color: Colors.greenAccent),
                                    )
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 1,
                                child: Row(
                                  children: const [
                                    SizedBox(width: 10),
                                    Text(
                                      "Fund Details",
                                      style:
                                          TextStyle(color: Colors.greenAccent),
                                    )
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Statements",
                                      style:
                                          TextStyle(color: Colors.greenAccent),
                                    )
                                  ],
                                ),
                              ),
                            ],
                            offset: const Offset(0, 80),
                            color: Colors.white,
                            elevation: 2,
                          ),
                        ],
                      ),
                      /*Row(children: [
                      SizedBox(width: size.width*0.13),
                      Text("Equity/Large cap",style: TextStyle(color: Colors.grey,
                      fontSize:size.height*0.015 ),)
                    ],),*/
                      Divider(
                        thickness: 1.5,
                        height: 10,
                      ),
                      SizedBox(height: size.height * 0.017),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: size.width * 0.075),
                          const Text(
                            "Invested",
                            style: TextStyle(
                                color: Colors.grey,
                                //fontSize: size.height * 0.016,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: size.width * 0.18),
                          const Text(
                            "Current Value",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: size.width * 0.13),
                          const Text(
                            "Return%",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: size.width * 0.075),
                          Text(
                            r'$45,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.016),
                          ),
                          SizedBox(width: size.width * 0.26),
                          Text(
                            r'$60,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.016),
                          ),
                          SizedBox(width: size.width * 0.19),
                          Text(
                            r'12.67%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                                fontSize: size.height * 0.016),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.5,
                        height: 10,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(height: size.height * 0.017),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: size.width * 0.075),
                          const Text(
                            "Avg Buying Nav",
                            style: TextStyle(
                                color: Colors.grey,
                                //fontSize: size.height * 0.016,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: size.width * 0.08),
                          const Text(
                            "Current NAV",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: size.width * 0.15),
                          const Text(
                            "Units",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: size.width * 0.075),
                          Text(
                            r'$45,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.016),
                          ),
                          SizedBox(width: size.width * 0.26),
                          Text(
                            r'$60,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.016),
                          ),
                          SizedBox(width: size.width * 0.19),
                          Text(
                            r'12.67%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                                fontSize: size.height * 0.016),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                );
              }),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                'Transactions',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: size.width * 0.65,
              ),
              Icon(Icons.network_cell),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 10,
                  // shadowColor: Colors.greenAccent,
                  child: Column(
                    children: [
                      //TextButton(onPressed: (){}, child: const Text('back',style: TextStyle(color: Colors.black),)),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: size.width * 0.033),
                          SizedBox(
                            height: size.height * 0.03,
                            width: size.width * 0.06,
                            //color: Colors.pink,
                            child: Image.asset('images/icici.png',
                                fit: BoxFit.cover),
                          ),
                          SizedBox(width: size.width * 0.05),
                          Text(
                            "ICICI Prudential Emerging Blue Chip",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: size.width * 0.08),
                          PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Row(
                                  children: const [
                                    SizedBox(width: 10),
                                    Text(
                                      "View Details",
                                      style:
                                          TextStyle(color: Colors.greenAccent),
                                    )
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Invest",
                                      style:
                                          TextStyle(color: Colors.greenAccent),
                                    )
                                  ],
                                ),
                              ),
                            ],
                            offset: const Offset(0, 80),
                            color: Colors.white,
                            elevation: 2,
                          ),
                        ],
                      ),
                      /*Row(children: [
                      SizedBox(width: size.width*0.13),
                      Text("Equity/Large cap",style: TextStyle(color: Colors.grey,
                      fontSize:size.height*0.015 ),)
                    ],),*/
                      Divider(
                        thickness: 1.5,
                        height: 10,
                      ),
                      SizedBox(height: size.height * 0.017),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: size.width * 0.075),
                          const Text(
                            "Invested",
                            style: TextStyle(
                                color: Colors.grey,
                                //fontSize: size.height * 0.016,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: size.width * 0.18),
                          const Text(
                            "Current Value",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: size.width * 0.13),
                          const Text(
                            "Return%",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),

                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: size.width * 0.075),
                          Text(
                            r'$45,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.016),
                          ),
                          SizedBox(width: size.width * 0.26),
                          Text(
                            r'$60,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.016),
                          ),
                          SizedBox(width: size.width * 0.19),
                          Text(
                            r'12.67%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                                fontSize: size.height * 0.016),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.5,
                        height: 10,
                        color: Colors.greenAccent,
                      ),
                      SizedBox(height: size.height * 0.017),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: size.width * 0.075),
                          const Text(
                            "Avg Buying Nav",
                            style: TextStyle(
                                color: Colors.grey,
                                //fontSize: size.height * 0.016,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: size.width * 0.08),
                          const Text(
                            "Current NAV",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: size.width * 0.15),
                          const Text(
                            "Units",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: size.width * 0.075),
                          Text(
                            r'$45,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.016),
                          ),
                          SizedBox(width: size.width * 0.26),
                          Text(
                            r'$60,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height * 0.016),
                          ),
                          SizedBox(width: size.width * 0.19),
                          Text(
                            r'12.67%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                                fontSize: size.height * 0.016),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                );
              }),
        ],
      )),
    );
  }
}
