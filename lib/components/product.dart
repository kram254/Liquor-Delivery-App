import 'package:flutter/material.dart';
import 'package:lika/models/product_model.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/view/product/single_product.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
  final MProduct product;
  Product({this.product});
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  // bool liked = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w / 2.2,
      height: w / 2.2 + 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 6,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/img/${widget.product.image}',
                  width: w / 2.2,
                  height: w / 2.2,
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    icon: widget.product.liked
                        ? Icon(
                            Icons.favorite,
                            color: orange,
                          )
                        : Icon(
                            Icons.favorite_border,
                          ),
                    onPressed: () =>
                        Provider.of<CProduct>(context, listen: false)
                            .likeUnlike(widget.product.id),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SingleProduct(
                              product: widget.product,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<CProduct>(context, listen: false)
                                .addToCart(widget.product);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                48,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[200],
                                  blurRadius: 6,
                                  offset: Offset(0, 0),
                                )
                              ],
                              color: accent,
                            ),
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.black,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.product.quantity,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      "Ksh ${widget.product.price}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
