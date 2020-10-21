import 'package:flutter/material.dart';
import 'package:lika/components/after_cart.dart';
import 'package:lika/components/settings.dart';
import 'package:lika/models/product_model.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/utils/helpers.dart';
import 'package:lika/view/product/search.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String name, phone, location, token;
  @override
  Widget build(BuildContext context) {
    double total = Provider.of<CProduct>(context).total;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  'assets/logo/logo.png',
                  width: 25,
                  height: 35,
                ),
              ),
              Text(
                "LIKA",
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
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Confirm Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              setHeight(16),
              TextFormField(
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefixIcon: Icon(Icons.person),
                  hintText: "Full Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      48,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: accentTransparent,
                  filled: true,
                ),
              ),
              setHeight(16),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefixIcon: Icon(Icons.phone),
                  hintText: "Phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      48,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: accentTransparent,
                  filled: true,
                ),
              ),
              setHeight(16),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefixIcon: Icon(Icons.location_on),
                  hintText: "Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      48,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: accentTransparent,
                  filled: true,
                ),
              ),
              setHeight(16),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefixIcon: Icon(Icons.credit_card),
                  hintText: "Payment method",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      48,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: accentTransparent,
                  filled: true,
                ),
              ),
              setHeight(16),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefixIcon: Icon(Icons.local_offer),
                  hintText: "Discount token",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      48,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: accentTransparent,
                  filled: true,
                ),
              ),
              setHeight(24),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                child: Wrap(
                  children: [
                    Text(
                      "Total: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$total",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              setHeight(16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ThanksForShopping();
                        },
                      ),
                    );
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
                        "Checkout",
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
        ),
      ),
    );
  }
}
