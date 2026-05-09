import 'package:ecommerce/data/products_data.dart';
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  List filtersearchresult = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(products[i]["name"]),
            ),
          );
        },
      );
    } else {
      filtersearchresult = products
          .map((e) => e["name"])
          .where((element) => element.contains(query))
          .toList();
      return ListView.builder(
        itemCount: filtersearchresult.length,
        itemBuilder: (context, i) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(filtersearchresult[i]),
            ),
          );
        },
      );
    }
  }
}
