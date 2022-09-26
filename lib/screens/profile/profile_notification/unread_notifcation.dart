import 'package:flutter/material.dart';

class UnreadNotification extends StatefulWidget {
  const UnreadNotification({Key? key}) : super(key: key);

  @override
  State<UnreadNotification> createState() => _UnreadNotificationState();
}

class _UnreadNotificationState extends State<UnreadNotification> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.03),
          Card(
            color: Colors.transparent,
            elevation: 15,
            child: Container(
              height: size.height * 0.085,
              width: size.width * 0.88,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffc9c7be)),
              child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Icon(
                        Icons.wysiwyg,
                        color: Color(0xff7bb185),
                        size: size.height * 0.045,
                      ),
                      SizedBox(width: size.width * 0.02),
                      const Text(
                        'Your order is successfully placed to \n '
                        'Investment in ABC Mutual fund',
                        style: TextStyle(color: Color(0xff5a685b)),
                      ),
                      SizedBox(width: size.width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Color(0xff7b98a6),
                            size: size.height * 0.04,
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
          Card(
            color: Colors.transparent,
            elevation: 15,
            child: Container(
              height: size.height * 0.085,
              width: size.width * 0.88,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffd7d8d1)),
              child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Icon(
                        Icons.whatshot_sharp,
                        color: Color(0xffac5c5d),
                        size: size.height * 0.045,
                      ),
                      SizedBox(width: size.width * 0.02),
                      const Text(
                        'Your request to redeem funds from \n '
                        'ABC mutual fund is received',
                        style: TextStyle(color: Color(0xff5a685b)),
                      ),
                      SizedBox(width: size.width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Color(0xff7b98a6),
                            size: size.height * 0.04,
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
          Card(
            color: Colors.transparent,
            elevation: 15,
            child: Container(
              height: size.height * 0.085,
              width: size.width * 0.88,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffc6c6bb)),
              child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Icon(
                        Icons.timer,
                        color: Color(0xffddd196),
                        size: size.height * 0.045,
                      ),
                      SizedBox(width: size.width * 0.02),
                      const Text(
                        "Your order is under process",
                        style: TextStyle(color: Color(0xff5a685b)),
                      ),
                      SizedBox(width: size.width * 0.155),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Color(0xff7b98a6),
                            size: size.height * 0.04,
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
