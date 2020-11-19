import 'package:flutter/material.dart';
import 'package:lika/components/fab.dart';
import 'package:lika/components/product.dart';
import 'package:lika/components/settings.dart';
import 'package:lika/models/product_model.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/utils/helpers.dart';
import 'package:lika/view/product/categories.dart';
import 'package:lika/view/product/search.dart';
import 'package:provider/provider.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  DateTime currentBackPressTime;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
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
            listProducts(context, "Trending"),
            listProducts(context, "Top Products"),
            listProducts(context, "Discounted Products"),
            listProducts(context, "Favorites"),
          ],
        ),
      ),
      floatingActionButton: FAB(),
    );
  }

  Widget listProducts(BuildContext context, String label) {
    var provider = Provider.of<CProduct>(context);
    return SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Categories();
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: accent,
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text("View more"),
                          setWidth(4),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            setHeight(16),
            Container(
              height: MediaQuery.of(context).size.width / 2.2 + 90,
              child: ListView.builder(
                  // itemExtent:
                  //     MediaQuery.of(context).size.width / 2.2 + 20,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: provider.products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Product(product: provider.products[i]),
                        setWidth(16)
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;

      _key.currentState.showSnackBar(
        SnackBar(
          content: Container(
            width: _key.currentContext.size.width * 0.6,
            margin: const EdgeInsets.all(8.0),
            child: Text("Click again to exit"),
          ),
        ),
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
