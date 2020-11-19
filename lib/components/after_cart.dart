import 'package:flutter/material.dart';
import 'package:lika/components/settings.dart';
import 'package:lika/models/product_model.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/utils/helpers.dart';
import 'package:lika/view/product/search.dart';
import 'package:provider/provider.dart';

class ThanksForShopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/logo/logo.png',
                    width: 25,
                    height: 35,
                  ),
                ],
              ),
              Text(
                "TurnUp",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Settings();
                  });
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          setHeight(80),
          Icon(
            Icons.check_circle_outline,
            color: secondary,
            size: 150,
          ),
          setHeight(24),
          Text(
            "Thanks for shopping with us",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          setHeight(16),
          Center(
            child: GestureDetector(
              onTap: () {
                Provider.of<CProduct>(context, listen: false).clearCart();
                Navigator.of(context).popUntil((route) {
                  return !Navigator.of(context).canPop();
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(
                    48,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
