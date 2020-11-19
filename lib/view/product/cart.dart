import 'package:flutter/material.dart';
import 'package:lika/components/cart_item.dart';
import 'package:lika/components/settings.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/utils/helpers.dart';
import 'package:lika/view/checkout/checkout.dart';
import 'package:lika/view/product/search.dart';
import 'package:lika/models/product_model.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MProduct> _cart = Provider.of<CProduct>(context).cart;
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
                  // width: 30,
                  scale: 0.3,
                  height: 35,
                ),
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
      body: Stack(
        children: [
          ClipPath(
            clipper: SClipper(),
            child: Container(
              decoration: BoxDecoration(
              /*** gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [secondary, accentTransparent],
                  stops: [0, 0.6],
                ),
                ***/
              ),
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your cart",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<CProduct>(context, listen: false)
                                .clearCart();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(48),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[300],
                                    blurRadius: 6,
                                    offset: Offset(0, 0),
                                  ),
                                ]),
                            child: Center(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Icon(
                                    Icons.clear,
                                    size: 18,
                                  ),
                                  setWidth(4),
                                  Text("Clear"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    setHeight(16),
                    Container(
                      child: _cart.length > 0
                          ? Column(
                              children: _cart
                                  .map(
                                    (item) => Column(
                                      children: [
                                        CartItem(
                                          product: item,
                                        ),
                                        setHeight(12),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            )
                          : Center(
                              child: Text(
                                "Empty",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                    ),
                    setHeight(16),
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
                    Container(
                      child: _cart.length > 0
                          ? Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Checkout();
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(
                                      48,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Proceed to Checkout",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.3);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.9);
    path.lineTo(size.width, -40);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
