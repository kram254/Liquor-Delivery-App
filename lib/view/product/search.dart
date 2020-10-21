import 'package:flutter/material.dart';
import 'package:lika/components/fab.dart';
import 'package:lika/components/seach_item.dart';
import 'package:lika/models/product_model.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop());
  }

  @override
  Widget buildResults(BuildContext context) {
    var provider = Provider.of<CProduct>(context);
    List<MProduct> _product = provider.products;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 16),
        child: ListView.builder(
          itemCount: _product.length,
          itemBuilder: (context, i) {
            return SearchItem(
              product: _product[i],
            );
          },
        ),
      ),
      floatingActionButton: FAB(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var provider = Provider.of<CProduct>(context);
    List<MProduct> _product = provider.products;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: ListView.builder(
          itemCount: _product.length,
          itemBuilder: (context, i) {
            return SearchItem(
              product: _product[i],
            );
          },
        ),
      ),
      floatingActionButton: FAB(),
    );
  }
}
