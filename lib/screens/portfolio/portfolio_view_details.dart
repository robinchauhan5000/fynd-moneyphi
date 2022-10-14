import 'package:flutter/material.dart';

class PortFolioTransactionScreen extends StatefulWidget {
  const PortFolioTransactionScreen({Key? key}) : super(key: key);

  @override
  State<PortFolioTransactionScreen> createState() =>
      _PortFolioTransactionScreenState();
}

class _PortFolioTransactionScreenState
    extends State<PortFolioTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: size.height * 0.04,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,
            ),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  'Redeem',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: size.height * 0.04,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,
            ),
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  'Invest',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              color: Colors.transparent,
              elevation: 15,
              child: Container(
                //padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                height: size.height * 0.33,
                width: size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'back',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: size.width * 0.8),
                        Icon(Icons.height),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: size.width * 0.02),
                        Image.asset('images/icici.png',
                            height: size.height * 0.05,
                            width: size.width * 0.05),
                        SizedBox(width: size.width * 0.03),
                        Text(
                          'ICICI Prudential Emerging Blue Chip',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.018,
                          ),
                        )
                      ],
                    ),
                    //SizedBox(height: size.height*0.01,),
                    Row(
                      children: [
                        SizedBox(width: size.width * 0.095),
                        const Text(
                          'Equity/ Large Cap',
                          style: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),

                    const Divider(thickness: 2),
                    SizedBox(height: size.height * 0.02),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Invested',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Current Value',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Return%',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          r'$45,000',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          r'$60,000',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          r'12.67%',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),

                    const Divider(thickness: 2),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Avg Buying Nav',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Current Nav',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Units',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          r'$47,8756',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          r'$75,9856',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          r'100,5987',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 15,
              child: Container(
                //padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                height: size.height * 0.27,
                width: size.width,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        const Text(
                          'Transactions',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: size.width * 0.6),
                        Icon(
                          Icons.next_plan,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        SizedBox(width: size.width * 0.02),
                        Image.asset('images/icici.png',
                            height: size.height * 0.05,
                            width: size.width * 0.05),
                        SizedBox(width: size.width * 0.03),
                        Text(
                          '15-jun-2022',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.018,
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey),
                          child: const Center(
                            child: Text(
                              'Skip',
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.065),
                        const Text(
                          '2nd Installment missed',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    //SizedBox(height: size.height*0.01,),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Avg Buying Nav',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Current Nav',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Units',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Nav',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          r'$500',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          r'-',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          r'-',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          r'-',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(thickness: 2),
                    SizedBox(height: size.height * 0.013),

                    Row(
                      children: [
                        SizedBox(width: size.width * 0.04),
                        const Text(
                          r'Follo no',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: size.width * 0.02),
                        const Text(
                          r'123456789/10',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: size.width * 0.2),
                        const Text(
                          r'Goal',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: size.width * 0.02),
                        const Text(
                          r'Retirement',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 15,
              child: Container(
                //padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                height: size.height * 0.27,
                width: size.width,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        const Text(
                          'Transactions',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: size.width * 0.6),
                        Icon(
                          Icons.next_plan,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        SizedBox(width: size.width * 0.02),
                        Image.asset('images/icici.png',
                            height: size.height * 0.05,
                            width: size.width * 0.05),
                        SizedBox(width: size.width * 0.03),
                        Text(
                          '15-jun-2022',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.018,
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey),
                          child: const Center(
                            child: Text(
                              'Skip',
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.065),
                        const Text(
                          '2nd Installment missed',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    //SizedBox(height: size.height*0.01,),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Avg Buying Nav',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Current Nav',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Units',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Nav',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          r'$500',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          r'-',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          r'-',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          r'-',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(thickness: 2),
                    SizedBox(height: size.height * 0.013),

                    Row(
                      children: [
                        SizedBox(width: size.width * 0.04),
                        const Text(
                          r'Follo no',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: size.width * 0.02),
                        const Text(
                          r'123456789/10',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: size.width * 0.2),
                        const Text(
                          r'Goal',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: size.width * 0.02),
                        const Text(
                          r'Retirement',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
