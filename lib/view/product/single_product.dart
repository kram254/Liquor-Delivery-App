import 'package:flutter/material.dart';
import 'package:lika/components/fab.dart';
import 'package:lika/components/settings.dart';
import 'package:lika/models/product_model.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/utils/helpers.dart';
import 'package:lika/view/product/search.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatelessWidget {
  final MProduct product;
  SingleProduct({this.product});
  @override
  Widget build(BuildContext context) {
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
              showSearch(context: context, delegate: Search());
            },
          )
        ],
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: SClipper(),
            child: Container(
              decoration: BoxDecoration(
                /***gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [orange, accentTransparent],
                ),
                ***/
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(
              16,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/img/${product.image}",
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: product.liked
                                  ? Icon(
                                      Icons.favorite,
                                      color: orange,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                    ),
                              onPressed: () =>
                                  Provider.of<CProduct>(context, listen: false)
                                      .likeUnlike(product.id),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Provider.of<CProduct>(context, listen: false)
                                      .addToCart(product);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        48,
                                      ),
                                      color: primary,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[300],
                                          offset: Offset(0, 0),
                                          blurRadius: 6,
                                        ),
                                      ]),
                                  child: Center(
                                    child: Text(
                                      "Add to cart",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        setHeight(8),
                        Text(
                          product.quantity,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600],
                          ),
                        ),
                        setHeight(8),
                        Text(
                          "Ksh ${product.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800],
                          ),
                        ),
                        setHeight(8),
                        Row(
                          children: [
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star_half),
                            Icon(Icons.star_border),
                          ],
                        ),
                        setHeight(16),
                        Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                        ),
                        setHeight(32)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FAB(),
    );
  }
}

class SClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.width * 0.65);
    path.quadraticBezierTo(
        size.width * 0.4, size.height * 0.7, size.width, size.height * 0.65);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
