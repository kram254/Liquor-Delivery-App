import 'package:flutter/material.dart';
import 'package:lika/models/product_model.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/utils/helpers.dart';
import 'package:lika/view/product/single_product.dart';
import 'package:provider/provider.dart';

class SearchItem extends StatelessWidget {
  final MProduct product;
  SearchItem({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              offset: Offset(0, 0),
              blurRadius: 6,
            ),
          ],
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Row(
            children: [
              Container(
                width: 130,
                child: Center(
                  child: Image.asset(
                    "assets/img/${product.image}",
                  ),
                ),
              ),
              setWidth(12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          product.title,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SingleProduct(
                                    product: product,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                48,
                              ),
                              color: primary,
                            ),
                            child: Text(
                              "View more",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "750 ml",
                    ),
                    Text(
                      "Ksh 4200",
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<CProduct>(context, listen: false)
                            .addToCart(product);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            48,
                          ),
                          color: accent,
                        ),
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
