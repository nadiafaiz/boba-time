import 'package:boba_time/screens/Menu/components/menu_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:boba_time/model/model.dart';
import 'dart:math';

import '../../widgets/app_text.dart';
import '../Location/location_screen.dart';
import '../Menu/menu.dart';
import '../Reward/reward_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key, name, required MenuItem menuItem})
      : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

Random random = new Random();
int randomNumber = random.nextInt(1000);

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    //String a = this.name.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xffffd8cf),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              color: const Color(0xfff2aea2),
              child: Image.asset(
                'assets/images/home.png',
              ),
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: const Color(0xfff0edca),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: AppText.normalText(
                          'Your order number: $randomNumber',
                          isBold: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Text(
            'Strawberry Green Tea',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Price: \$5.00',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Thank you for your order!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
