import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';
import 'package:trading_application/screens/home/components/viewers_line_chart.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DashBoard',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: appPadding,
          ),
          Container(
            width: double.infinity,
            height: 300,
            child: ViewLineChart(),
          )
        ],
      ),
    );
  }
}
