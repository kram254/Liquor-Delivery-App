import 'package:flutter/material.dart';
import 'package:lika/models/product_model.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/view/product/cart.dart';
import 'package:provider/provider.dart';

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CProduct>(context);
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(
          48,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Cart();
              },
            ),
          );
        },
        child: Container(
          child: Stack(
            children: [
              Center(
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: accent,
                  ),
                  child: Center(
                    child: Text(
                      provider.cart.length.toString(),
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
