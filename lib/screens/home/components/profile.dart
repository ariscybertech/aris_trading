import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: appPadding,
          ),
          Container(
            width: double.infinity,
            height: 160,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/person.jpg',
                    height: 160,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: appPadding / 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'John James',
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24),
                    ),
                    Text(
                      '65421755',
                      style: TextStyle(
                          color: black.withOpacity(0.5),
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    Row(
                      children: [
                        Icon(Icons.email_outlined),
                        SizedBox(
                          width: appPadding / 4,
                        ),
                        Text(
                          'abc123@gmail.com',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.home_outlined),
                        SizedBox(
                          width: appPadding / 4,
                        ),
                        Text(
                          'xyz street Abc',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
