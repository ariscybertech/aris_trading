import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';

import 'components/custom_tab_bar.dart';
import 'components/marcket_watch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      extendBody: false,
      appBar: AppBar(
        leading: Icon(Icons.menu,),
        title: Text('Trading App'),
      ),
      body: Column(
        children: [
          MarketWatch(),
          CustomTabBar(),
        ],
      ),
    );
  }
}
