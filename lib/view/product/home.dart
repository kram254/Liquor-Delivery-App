// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:lika/components/fab.dart';
import 'package:lika/components/product.dart';
import 'package:lika/components/settings.dart';
import 'package:lika/models/product_model.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/view/product/search.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime currentBackPressTime;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 5), () => Crashlytics.instance.crash());
    var provider = Provider.of<CProduct>(context);
    List<MProduct> products = provider.products;

    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: primary,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  'assets/logo/logo.png',
                  width: 50,
                  height: 70,
                ),
              ),
            //  Text("TurnUp",style: TextStyle(color: Colors.green), )
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
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Container(
          color: lgrey,
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 9 / 16,
              crossAxisSpacing: 16,
              mainAxisSpacing: 32,
            ),
            itemCount: products.length * 2,
            itemBuilder: (context, i) {
              return Product(
                product: products[i % products.length],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FAB(),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;

      _key.currentState.showSnackBar(SnackBar(
          content: Container(
        width: _key.currentContext.size.width * 0.6,
        margin: const EdgeInsets.all(8.0),
        child: Text("Click again to exit"),
      )));
      return Future.value(false);
    }
    return Future.value(true);
  }
}
