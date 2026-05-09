import 'package:ecommerce/item_details.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map product;
  final bool isDarkMode;
  final Function addtocart;
  final Function addtoFavorit;

  const ProductCard({
    super.key,
    required this.product,
    required this.isDarkMode,
    required this.addtocart,
    required void Function() addToCart,
    required this.addtoFavorit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetails(
              data: product,
              addToCart: addtocart,
              addtoFavorite: addtoFavorit,
            ),
          ),
        );
      },
      child: Card(
        color: isDarkMode ? Colors.grey[700] : Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  product["image"],
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              product["name"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              product["description"],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(height: 5),
            Text(
              product["price"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
