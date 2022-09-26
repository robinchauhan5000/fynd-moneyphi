import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                commonTile(),
                SizedBox(
                  height: 20,
                ),
                commonTile(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: commonTile(),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: commonTile(),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget commonTile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name"),
        Card(
          elevation: 5,
          child: TextFormField(
            initialValue: "Vishal Patel",
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[600]),
                hintText: "Type in your text",
                fillColor: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
