import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List favorites;
  final Function removefromFavorite;

  const FavoritePage({
    super.key,
    required this.favorites,
    required this.removefromFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Image.asset(favorites[i]["image"], width: 50),
          title: Text(favorites[i]["name"]),
          subtitle: Text(favorites[i]["price"]),
          trailing: IconButton(
            onPressed: () {
              removefromFavorite(i);
            },
            icon: Icon(Icons.delete_forever, color: Colors.red),
          ),
        );
      },
    );
  }
}
