import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trading_application/constants/constants.dart';

class MarketWatch extends StatefulWidget {
  const MarketWatch({Key? key}) : super(key: key);

  @override
  _MarketWatchState createState() => _MarketWatchState();
}

class _MarketWatchState extends State<MarketWatch> {

  @override
  void initState() {
    super.initState();
    setStocks();

  }
  setStocks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future<bool> stocks = prefs.setStringList("stocks",[]);
  }

  // late List<Datum> dataList;
  late int dataListLength;

  final quantity = TextEditingController(text: "1");
  final newPrice = TextEditingController();
  late List<String> stocks;

  Future getData() async {
    final String fileContent =
        await rootBundle.loadString('assets/data/marketwatch.json');
    final data = await jsonDecode(fileContent);
    dataListLength = data["stocks"].length;
    return data;
  }

  saveDataToSP(String name, String price, String qty, String orderType, String exchange) async {

    final Map<String, String> item = Map<String, String>();
    item['name'] = name;
    item['price'] = price;
    item['quantity'] = qty;
    item['order'] = orderType;
    item['exchange'] = exchange;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    stocks = prefs.getStringList("stocks")!;
    stocks.add(jsonEncode(item));
    prefs.setStringList("stocks", stocks);
  }


  Future _buyDialogue(BuildContext context, String name, String currentPrice, String exchange) async {
    setState(() {
      newPrice.text = currentPrice;
    });
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return Dialog(
          elevation: 1.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          // contentPadding: EdgeInsets.only(top: 20.0,bottom: 20.0),
          child: Container(
            height: 250.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'BUY $name',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // padding: EdgeInsets.symmetric(vertical: 25.0),
                        height: 40.0,
                        width: 100.0,
                        // ignore: deprecated_member_use
                        child: Text('Quantity:',
                            style: TextStyle(
                                fontSize: 18.0
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180.0,
                        child:   new TextField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(hintText: "Enter quantity"),
                          controller: quantity,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // padding: EdgeInsets.symmetric(vertical: 25.0),
                        height: 40.0,
                        width: 100.0,
                        // ignore: deprecated_member_use
                        child: Text('Price:',
                            style: TextStyle(
                                fontSize: 18.0
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180.0,
                        child:   new TextField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(hintText: "Enter price"),
                          controller: newPrice,
                        ),
                      ),
                    ),

                  ],
                ),

                Text('Exchange: $exchange'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: const Text('Cancel',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                              fontSize: 20,
                              color: primary,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          saveDataToSP(name, currentPrice, quantity.text, "Buy", exchange );
                          Navigator.of(context).pop();
                          // updateTimeStamp();
                        },
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  Future _sellDialogue(BuildContext context, String name, String currentPrice, String exchange) async {
    setState(() {
      newPrice.text = currentPrice;
    });
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return Dialog(
          elevation: 1.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          // contentPadding: EdgeInsets.only(top: 20.0,bottom: 20.0),
          child: Container(
            height: 250.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'SELL $name',
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // padding: EdgeInsets.symmetric(vertical: 25.0),
                        height: 40.0,
                        width: 100.0,
                        // ignore: deprecated_member_use
                        child: Text('Quantity:',
                            style: TextStyle(
                                fontSize: 18.0
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180.0,
                        child:   new TextField(
                          decoration: new InputDecoration(hintText: "Enter quantity"),
                          controller: quantity,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // padding: EdgeInsets.symmetric(vertical: 25.0),
                        height: 40.0,
                        width: 100.0,
                        // ignore: deprecated_member_use
                        child: Text('Price:',
                            style: TextStyle(
                                fontSize: 18.0
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180.0,
                        child:   new TextField(
                          decoration: new InputDecoration(hintText: "Enter price"),
                          controller: newPrice,
                        ),
                      ),
                    ),

                  ],
                ),

                Text('Exchange: $exchange'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: const Text('Cancel',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                              fontSize: 20,
                              color: primary,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          saveDataToSP(name, currentPrice, quantity.text, "Sell", exchange );
                          Navigator.of(context).pop();
                          // updateTimeStamp();
                        },
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMarketWatch(BuildContext context, int index, snapshot) {
    String name = snapshot["stocks"][index]['name'].toString();
    String exchange = snapshot["stocks"][index]['exchange'].toString();
    int id = snapshot["stocks"][index]['id'];
    var currentPrice = snapshot["stocks"][index]['current_price'];

    return Padding(
      padding: const EdgeInsets.only(
          left: appPadding, bottom: appPadding / 2, top: appPadding / 2),
      child: Container(
        height: 150,
        width: 200,
        padding: EdgeInsets.all(appPadding / 2),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.5),
                offset: Offset(3, 3),
                blurRadius: 5,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$id',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: appPadding / 6,
                    ),
                    Text(
                      exchange,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Text(
                  '\$ $currentPrice',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    _buyDialogue(context,name,currentPrice.toString(),exchange);
                  },
                  child: Container(
                    width: 60,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Buy',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
                  ),
                ),
                InkWell(
                  onTap: (){
                    _sellDialogue(context,name,currentPrice.toString(),exchange);
                  },
                  child: Container(
                    width: 60,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                          'Sell',
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w800,
                          ),
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Market Watch',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
              Text(
                'View all',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold, color: primary),
              ),
            ],
          ),
        ),
        FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Text('No data');
              } else {
                return Container(
                  height: 180,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: dataListLength,
                    itemBuilder: (context, index) {
                      return _buildMarketWatch(context, index, snapshot.data);
                    },
                  ),
                );
              }
            })
      ],
    );
  }
}
