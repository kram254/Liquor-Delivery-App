import 'package:flutter/material.dart';
import 'package:lika/models/product_model.dart';
import 'package:lika/utils/helpers.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final MProduct product;
  CartItem({this.product});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CProduct>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              offset: Offset(0, 0),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              child: Image.asset("assets/img/${product.image}"),
              width: 130,
            ),
            setWidth(24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  product.title,
                ),
                Text(
                  "${product.pieces} Pieces",
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(0, 0),
                        blurRadius: 4,
                      ),
                    ],
                    color: Colors.white,
                    // border: Border.all(
                    //   color: Colors.grey,
                    // ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: () => provider.removeItem(product),
                          child: Icon(
                            Icons.remove,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text("${product.pieces}"),
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () => provider.addToCart(product),
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
