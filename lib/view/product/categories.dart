import 'package:flutter/material.dart';
import 'package:lika/components/fab.dart';
import 'package:lika/components/product.dart';
import 'package:lika/components/settings.dart';
import 'package:lika/models/product_model.dart';
import 'package:lika/utils/colors.dart';
import 'package:lika/view/product/search.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> _categories = [
    "whiskey",
    "vodka",
    "rum",
    "beer",
    "wine",
    "soda",
    "brandy",
    "lime",
  ];
  String _category = "whiskey";
  @override
  Widget build(BuildContext context) {
    List<MProduct> _products = Provider.of<CProduct>(context).products;
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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 26,
                  child: ListView.builder(
                      itemCount: _categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return Container(
                          width: MediaQuery.of(context).size.width / 5,
                          margin: EdgeInsets.only(right: 6),
                          child: GestureDetector(
                            onTap: () =>
                                setState(() => _category = _categories[i]),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(48),
                                color: _categories[i] == _category
                                    ? primary
                                    : accent,
                              ),
                              child: Center(
                                child: Text(
                                  _categories[i],
                                  style: TextStyle(
                                      color: _categories[i] == _category
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                  ),
                  child: Text(
                    _category,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return Product(
                    product: _products[i],
                  );
                },
                childCount: _products.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 9 / 15.6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 16,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FAB(),
    );
  }
}
