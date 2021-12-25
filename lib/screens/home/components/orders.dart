import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trading_application/constants/constants.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  List<Map<String, String>> listItems = [];

  // @override
  // void initState() {
  //   super.initState();
  //   getStocks();
  // }

  getStocks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedStocks = prefs.getStringList("stocks")!;
    print(savedStocks);
    // return savedStocks;
    setState(() {
      savedStocks.forEach((item) {
        listItems.add(jsonDecode(item));

      });
    });
  }

  Widget buildList(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: FutureBuilder(
        future: getStocks(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Text('No data');
            } else {
              return Container(
                height: 180,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(listItems[index]['Name']!),
                    );
                  },
                ),
              );
            }
          }
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Orders',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),),
          Container(
            height: 600,
            child: ListView.builder(
                itemCount: listItems.length, itemBuilder: buildList),
          )
        ],
      ),
    );
  }
}
