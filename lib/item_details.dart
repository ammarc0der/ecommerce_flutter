import 'package:ecommerce/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final data;
  final Function addToCart;
  final Function addtoFavorite;

  const ItemDetails({
    required this.data,
    required this.addToCart,
    required this.addtoFavorite,
    super.key,
  });

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int selectedIndex = 0;
  String selectedcolor = "grey";
  bool isfavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(widget.data['image']),
            ),
          ),

          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isfavourite = !isfavourite;
                });
                widget.addtoFavorite(widget.data);
              },
              icon: Icon(
                isfavourite ? Icons.favorite : Icons.favorite_border,
                color: isfavourite ? Colors.red : Colors.black,
              ),
            ),
          ),

          Container(
            child: Text(
              widget.data["name"],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.data["description"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.data["price"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.amber[700],
              ),
            ),
          ),

          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Color: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                // Gray
                Row(
                  children: [
                    Radio(
                      value: "gray",
                      groupValue: selectedcolor,
                      activeColor: Colors.orange,
                      onChanged: (value) {
                        setState(() {
                          selectedcolor = value!;
                        });
                      },
                    ),

                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),

                    SizedBox(width: 5),

                    Text("Gray"),
                  ],
                ),

                SizedBox(width: 20),

                // Black
                Row(
                  children: [
                    Radio(
                      value: "black",
                      groupValue: selectedcolor,
                      activeColor: Colors.orange,
                      onChanged: (value) {
                        setState(() {
                          selectedcolor = value!;
                        });
                      },
                    ),

                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),

                    SizedBox(width: 5),

                    Text("Black"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              "Size :  34   35  49  41 ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                widget.addToCart(widget.data);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[700],
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
