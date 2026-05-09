import 'package:ecommerce/cart.dart';
import 'package:ecommerce/components/custom_app_bar.dart';
import 'package:ecommerce/components/custom_nav_Bar.dart';
import 'package:ecommerce/components/custom_search.dart';
import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/data/products_data.dart';
import 'package:ecommerce/favorite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const Homepage({super.key, required this.onThemeChanged});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  bool isDarkMode = false;

  List cart = [];
  List favorites = [];

  //add to cart function
  void addToCart(dynamic product) {
    setState(() {
      cart.add(product);
    });
  }

  //remove to cart function
  void removeFromCart(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  // add to favorite function
  void addToFavorite(product) {
    setState(() {
      if (!favorites.contains(product)) {
        favorites.add(product);
      }
    });
  }

  // remove from favorite function
  void removeFromFavorite(int index) {
    setState(() {
      favorites.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Text(
                "Settings",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SwitchListTile(
              title: Text("Dark Mode"),
              secondary: Icon(Icons.dark_mode),
              value: isDarkMode,
              onChanged: (val) {
                setState(() {
                  isDarkMode = val;
                });
                widget.onThemeChanged(val);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout"),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil("login", (route) => false);
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomNavBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          "Search products...",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.all(20),
                            child: Icon(
                              categories[i]["icon"],
                              size: 40,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            categories[i]["title"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Best Selling",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  itemCount: products.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 280,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, i) {
                    return ProductCard(
                      product: products[i],
                      isDarkMode: isDarkMode,
                      addToCart: () => addToCart(products[i]),
                      addtocart: addToCart,
                      addtoFavorit: addToFavorite,
                    );
                  },
                ),
              ],
            ),
          ),
          CartPage(cart: cart, removeFromCart: removeFromCart),
          FavoritePage(
            favorites: favorites,
            removefromFavorite: removeFromFavorite,
          ),
        ],
      ),
    );
  }
}
